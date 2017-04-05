class Api::V1::CartsController < Api::V1::BaseController

  def create
    @cart = Cart.new cart_params

    unless @cart.valid?
      render json: {errors: @cart.errors.messages}, status: :unprocessable_entity and return
    end

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

    Dir.mkdir(pdf_path) unless File.exists?(pdf_path)

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

  private

  def cart_params
    params.require(:cart).permit(:quantity, :price, :stripe_token, customer_attributes: [:country, :city, :state, :suburb, :address, :postcode, :email, :fullname])
  end
end
