class RecipeCategoriesController < PublicController
  def index
    @categories = RecipeCategory.all
  end
end
