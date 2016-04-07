require 'rails_helper'

RSpec.describe "IngredientCategories", type: :request do
  describe "GET /ingredient_categories" do
    it "works! (now write some real specs)" do
      get ingredient_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
