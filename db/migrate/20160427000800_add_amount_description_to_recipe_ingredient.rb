class AddAmountDescriptionToRecipeIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :amount_description, :string
  end
end
