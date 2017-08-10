class Api::V1::CartsController < Api::V1::BaseController

  def create
    @cart = Cart.new cart_params

    unless @cart.valid?
      render json: {errors: @cart.errors.messages}, status: :unprocessable_entity and return
    end

    @cart.save

    render :show
  rescue Stripe::CardError => e
    render json: {errors: e.message}
  end

  def checkout
    @cart = Cart.find params[:id]
    @cart.attributes = cart_params

    # Do the payment
    stripe_customer = Stripe::Customer.create(
      email: @cart.customer.email,
      source: @cart.stripe_token
    )

    charge = Stripe::Charge.create(
      customer: stripe_customer.id,
      amount: (@cart.total.to_r*100).to_i, #Stripe accepts cents
      description: @cart.reference_number,
      currency: 'aud'
    )

    # create a invoice pdf and upload to s3
    pdf_html = render_to_string template: "admin/carts/invoice.html.erb", locale: {cart: @cart}, layout: false
    doc_pdf = WickedPdf.new.pdf_from_string pdf_html

    Dir.mkdir(Rails.root.join('tmp/invoices')) unless File.exists?(Rails.root.join('tmp/invoices'))

    pdf_path = Rails.root.join('tmp/invoices', "#{@cart.reference_number}.pdf")

    File.open(pdf_path, 'wb') do |file|
      file << doc_pdf
    end
    @cart.invoice = File.open pdf_path

    # Do the transition and save the cart shipping address
    @cart.save!

    File.delete(pdf_path) if File.exist?(pdf_path)

    # send email notifications
    CartMailer.delay.dispatch_invoice @cart

    render :show
  rescue ActiveRecord::RecordNotFound => e
    render json: {errors: e.message}, status: :unprocessable_entity
  end

  def coupon
    @cart = Cart.new cart_params
    @cart.coupon = Coupon.find_by! code: @cart.coupon.code
    @cart.shipping_fee = Cart::SHIPPING_FEE
    @cart.coupon.apply({ shipping_fee: @cart.shipping_fee, quantity: @cart.quantity, total: @cart.total }) if @cart.has_coupon?

    render :show
  rescue ActiveRecord::RecordNotFound => e
    render json: {errors: e.message}, status: :unprocessable_entity
  end

  private

  def cart_params
    params.require(:cart).permit(
      :total, :stripe_token, :shipping_fee, :subtotal, :total,
      customer_attributes: [:id, :email, :fullname, addresses_attributes: [:street_address, :suite_apt, :city, :state, :country, :zip]],
      coupon_attributes: [:code],
      cart_products_attributes: [:product_id, :quantity, cart_product_ingredients_attributes: [:product_id, :ingredient_id, :weight, :price, :percentage]]
      )
  end
end
