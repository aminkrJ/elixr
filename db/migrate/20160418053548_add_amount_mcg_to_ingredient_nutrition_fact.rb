class AddAmountMcgToIngredientNutritionFact < ActiveRecord::Migration
  def change
    add_column :ingredient_nutrition_facts, :amount_mg, :decimal, precision: 10, scale: 2
  end
end
