class CreateIngredientCategories < ActiveRecord::Migration
  def change
    create_table :ingredient_categories do |t|
      t.string :title
      t.string :description
      t.string :color

      t.timestamps null: false
    end
  end
end
