class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unit

  def self.recipes_ingredients(recipe_ids)
    RecipeIngredient
      .select("premium, name, SUM(recipe_ingredients.amount) as total_amount")
      .joins(:ingredient)
      .where(recipe_id: recipe_ids)
      .group('ingredient_id, premium, name')
      .order('total_amount DESC')
  end
end
