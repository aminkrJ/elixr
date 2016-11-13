class RecipesController < PublicController

  def index
    @recipes = if params[:recipe_category_id]
      recipe_category = RecipeCategory.find params[:recipe_category_id]

      recipe_category
        .recipes
        .includes(:ingredients)
        .order("id DESC")
        .limit(25)
        .all
    else
      Recipe.includes(:ingredients).order("id DESC").limit(25).all
    end
  end

end
