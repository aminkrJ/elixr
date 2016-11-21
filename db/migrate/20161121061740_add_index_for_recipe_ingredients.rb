class AddIndexForRecipeIngredients < ActiveRecord::Migration
  def change
    add_index :recipe_ingredients, :recipe_id
    add_index :recipe_ingredients, :ingredient_id
  end
end
