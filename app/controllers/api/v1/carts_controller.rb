class Api::V1::CartsController < Api::V1::BaseController

  def create
    cart = Cart.create cart_params

    customer = Stripe::Customer.create(
      :email => cart.customer.email,
      :source  => cart.stripe_token
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => cart.total,
      :description => cart.reference_number,
      :currency    => 'aud'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity, :price, :stripe_token, customer_attributes: [:country, :city, :state, :subsurb, :address, :postcode, :email, :fullname])
  end
end
