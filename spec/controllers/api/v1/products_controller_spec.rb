require "rails_helper"

describe Api::V1::ProductsController do
  render_views

  describe "GET products" do
    before :each do
      @product1 = create :product
      @product2 = create :product
    end

    it "returns all products" do
      get :index, format: :json
      expect(assigns(:products).length).to be 2
    end

    it "returns short_description" do
      get :index, format: :json

      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(response.body).to include("short_description")
    end
  end
end
