class RecipesController < PublicController
  def index
    @recipes = Recipe.includes(:ingredients).order("id DESC").limit(25).all
  end
end
