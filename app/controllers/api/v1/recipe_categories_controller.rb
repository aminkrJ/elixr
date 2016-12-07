class Api::V1::RecipeCategoriesController < Api::V1::BaseController
  def index
    @categories = RecipeCategory.all
  end
end
