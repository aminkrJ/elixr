class Api::V1::CartsController < Api::V1::BaseController

  def show
    @cart = Cart.find_by_reference_number(params[:id])
    render :show
  rescue Stripe::CardError => e
    render json: {errors: e.message}
  end

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
    @cart = Cart.find_by_reference_number params[:id]
    @cart.attributes = cart_params

    Postcode.delivery @cart.customer.addresses.first.try(:zip) if @cart.customer.addresses.first.try(:zip)

    @cart.save!

    if @cart.pay
      @cart.transition_to! :purchased

      pdf_path = @cart.generate_invoice(render_to_string(template: "admin/carts/invoice.html.erb", locals: { cart: @cart, address: @cart.customer.addresses.first }, layout: false))
      @cart.invoice = File.open pdf_path

      @cart.dispatch_invoice

      File.delete(pdf_path) if File.exist?(pdf_path)

      render :show
    else
      render json: { errors: @cart.errors.messages }, status: :internal_server_error
    end

  rescue ActiveRecord::RecordNotFound => e
    render json: {errors: e.message}, status: :unprocessable_entity
  rescue ActiveRecord::RecordInvalid => e 
    render json: {errors: @cart.errors.messages}, status: :unprocessable_entity
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
      :total, :delivery_at, :stripe_token, :shipping_fee, :subtotal, :total, :vegan, :activated_nuts, :organic,
      customer_attributes: [:id, :email, :firstname, :lastname, addresses_attributes: [:street_address, :suburb, :suite_apt, :city, :state, :country, :zip]],
      coupon_attributes: [:code],
      cart_products_attributes: [:product_id, :quantity, cart_product_ingredients_attributes: [:product_id, :ingredient_id, :weight, :price, :percentage]]
      )
  end
end
