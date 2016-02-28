class CreateNutritionFacts < ActiveRecord::Migration
  def change
    create_table :nutrition_facts do |t|
      t.string :name
      t.string :category

      t.timestamps null: false
    end
  end
end
