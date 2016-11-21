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

  def show
    @recipe = Recipe.includes(recipe_ingredients: :ingredient).find_by_slug(params[:id])
  end
end
