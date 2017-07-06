class CreateCartProductIngredients < ActiveRecord::Migration
  def change
    create_table :cart_product_ingredients do |t|
      t.references :cart_product, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.integer :percentage
      t.decimal :price
      t.integer :weight

      t.timestamps null: false
    end
  end
end
