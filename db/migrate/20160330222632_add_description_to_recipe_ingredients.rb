class AddDescriptionToRecipeIngredients < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :description, :string
  end
end
