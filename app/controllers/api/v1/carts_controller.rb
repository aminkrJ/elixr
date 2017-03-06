class Api::V1::CartsController < Api::V1::BaseController

  def create
    #just persist a customer with status

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
