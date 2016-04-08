class CreateIngredientCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
