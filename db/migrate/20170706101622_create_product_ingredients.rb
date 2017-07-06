class CreateProductIngredients < ActiveRecord::Migration
  def change
    create_table :product_ingredients do |t|
      t.references :product, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.integer :percentage
      t.integer :weight
      t.integer :max_percentage
      t.integer :min_percentage

      t.timestamps null: false
    end
  end
end
