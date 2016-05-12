class RecipesController < PublicController
  def index
    @recipes = Recipe.joins(:recipe_ingredients).where(recipe_ingredients: {ingredient_id: params[:ids]}).distinct

    respond_to do |format|
      format.json { render json: @recipes }
    end
  end
end
