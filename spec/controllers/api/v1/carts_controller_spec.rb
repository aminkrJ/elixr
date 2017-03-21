require "rails_helper"

describe Api::V1::CartsController do
  render_views

  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:cart) {
    {quantity: 1, price: 30, stripe_token: stripe_helper.generate_card_token, customer_attributes:
    {country: 'a', city: 'b', state: 'c', suburb: 'd', address: 'e', postcode: 'f', email: 'test@test.com'}}
  }

  before do
  end

  describe "POST create" do
    it "create an invoice pdf" do
      StripeMock.start

      post :create, {cart: cart, format: :json}

      StripeMock.stop
    end
  end
end
