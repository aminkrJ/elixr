class Api::V1::IngredientsController < Api::V1::BaseController
  def index
    @ingredients = Ingredient.with_category
  end
end
