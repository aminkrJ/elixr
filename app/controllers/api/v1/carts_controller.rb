class Api::V1::CartsController < Api::V1::BaseController

  def create
    @cart = Cart.new cart_params

    unless @cart.valid?
      render json: {errors: @cart.errors.messages}, status: :unprocessable_entity and return
    end

    @cart.shipping_fee = Cart::SHIPPING_FEE
    @cart.save

    stripe_customer = Stripe::Customer.create(
      email: @cart.customer.email,
      source: @cart.stripe_token
    )

    @cart.customer.update stripe_customer_id: stripe_customer.id

    charge = Stripe::Charge.create(
      customer: stripe_customer.id,
      amount: (@cart.total.to_r*100).to_i, #Stripe accepts cents
      description: @cart.reference_number,
      currency: 'aud'
    )

    @cart.status = Cart::PAID
    pdf_html = render_to_string template: "admin/carts/invoice.html.erb", locale: {cart: @cart}, layout: false
    doc_pdf = WickedPdf.new.pdf_from_string pdf_html

    Dir.mkdir(Rails.root.join('tmp/invoices')) unless File.exists?(Rails.root.join('tmp/invoices'))

    pdf_path = Rails.root.join('tmp/invoices', "#{@cart.reference_number}.pdf")

    File.open(pdf_path, 'wb') do |file|
      file << doc_pdf
    end
    @cart.invoice = File.open pdf_path
    @cart.save!

    File.delete(pdf_path) if File.exist?(pdf_path)

    CartMailer.delay.dispatch_invoice @cart

    render :show

  rescue Stripe::CardError => e
    render json: {errors: e.message}
  end

  def coupon
    @cart = Cart.new cart_params
    @cart.coupon = Coupon.find_by! code: @cart.coupon.code
    @cart.shipping_fee = Cart::SHIPPING_FEE
    @cart.coupon.apply({ shipping_fee: @cart.shipping_fee, quantity: @cart.quantity, price: @cart.price }) if @cart.has_coupon?

    render :show
  rescue ActiveRecord::RecordNotFound => e
    render json: {errors: e.message}, status: :unprocessable_entity
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity, :price, :stripe_token, :shipping_fee,
                                 customer_attributes: [:country, :city, :state, :suburb, :address, :postcode, :email, :fullname],
                                 coupon_attributes: [:code]
                                )
  end
end
