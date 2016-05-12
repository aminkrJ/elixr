class IngredientsController < PublicController
  def index
    @ingredients = Ingredient.with_category

    respond_to do |format|
      format.json { render json: @ingredients }
    end
  end
end
