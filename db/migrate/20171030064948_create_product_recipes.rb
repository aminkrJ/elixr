class CreateProductRecipes < ActiveRecord::Migration
  def change
    create_table :product_recipes do |t|
      t.references :product, index: true, foreign_key: true
      t.references :recipe, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
