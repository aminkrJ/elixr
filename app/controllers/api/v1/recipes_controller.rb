class Api::V1::RecipesController < Api::V1::BaseController
  def index
    @recipes = if params[:recipe_category_id]
      recipe_category = RecipeCategory.find params[:recipe_category_id]

      recipe_category
        .recipes
        .includes(:ingredients, :recipe_category)
        .order("id DESC")
        .limit(25)
        .all
    else
      Recipe.includes(:ingredients, :recipe_category).order("id DESC").limit(25).all
    end
  end

  def show
    @recipe = Recipe.includes(recipe_ingredients: :ingredient).friendly.find(params[:id])
  end

  def shopping_list
    @recipe_ingredients = RecipeIngredient.recipes_ingredients params[:recipe_ids]
  end
end
