class CreateIngredientNutritionFacts < ActiveRecord::Migration
  def change
    create_table :ingredient_nutrition_facts do |t|
      t.decimal :amount
      t.integer :unit_id
      t.integer :ingredient_id
      t.integer :nutrition_fact_id

      t.timestamps null: false
    end
  end
end
