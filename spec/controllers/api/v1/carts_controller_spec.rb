require "rails_helper"

describe Api::V1::CartsController do
  render_views

  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:product_ingredient) { create :product_ingredient }
  let(:cart_product) { create :cart_product }
  let(:address_attribute) {
  }

  let(:cart_attributes) {
    {
      total: 110,
      shipping_fee: 10,
      subtotal: 100,
      customer_attributes: {
        email: 'foo@de.com'
      },
      cart_products_attributes: [
        {product_id: product_ingredient.product.id, quantity: 1,
          cart_product_ingredients_attributes: [
            {
              ingredient_id: product_ingredient.ingredient.id,
              percentage: 1,
              weight: 10,
              price: 20
            }
          ]
        }
      ]
    }
  }

  describe "POST checkout" do
    let(:stripe_helper) { StripeMock.create_test_helper }
    let(:existing_cart_attributes) {
      {
        total: 120,
        customer_attributes: {
        id: cart_product.cart.customer.id,
          addresses_attributes: [
            {
              street_address: "327/38 Albany",
              city: "Sydney",
              state: "NSW",
              zip: "2056"
            }
          ]
        }
      }
    }

    before :each do
      StripeMock.start
    end

    after :each do
      StripeMock.stop
    end

    it "raises error while paying with incorrect card" do
      StripeMock.prepare_card_error(:card_declined)

      post :checkout, { id: cart_product.cart.id, cart: existing_cart_attributes, format: :json }

      expect(response).to have_http_status(500)
    end

    describe "checkout" do
      before { post :checkout, { id: cart_product.cart.id, cart: existing_cart_attributes, format: :json }
}
      it "saves the customer info" do
        expect(assigns(:cart).customer.addresses.first.street_address).to eq("327/38 Albany")
      end

      it "flags cart as being purchased" do
        expect(assigns(:cart).state.current_state).to eq("purchased")
      end
    end
  end

  describe "POST create" do
    it "create a pending cart with its customer" do
      post :create, { cart: cart_attributes, format: :josn }

      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
    end
  end
end
