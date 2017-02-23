class Api::V1::OrdersController < Api::V1::BaseController

  def create
    # verifying products
    # adding products to a cart
    # create a customer
    # persist the cart
    # charge the customer
    # change the state of the order


    @amount = 500 # in cents

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => '',
      :currency    => 'aud'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end
end
