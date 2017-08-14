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

    @cart.pay

    pdf_path = @cart.generate_invoice
    @cart.invoice = File.open pdf_path

    @cart.save!

    @cart.dispatch_invoice

    File.delete(pdf_path) if File.exist?(pdf_path)

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
