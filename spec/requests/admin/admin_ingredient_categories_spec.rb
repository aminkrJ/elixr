require 'rails_helper'

RSpec.describe "Admin::IngredientCategories", type: :request do
  describe "GET /admin_ingredient_categories" do
    it "works! (now write some real specs)" do
      get admin_ingredient_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
