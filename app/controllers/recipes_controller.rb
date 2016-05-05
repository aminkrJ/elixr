class RecipesController < PublicController
  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.json { render json: @recipes }
    end
  end
end
