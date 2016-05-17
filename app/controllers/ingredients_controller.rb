class IngredientsController < PublicController
  def index
    @ingredients = Ingredient.with_category
  end
end
