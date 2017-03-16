class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.decimal :price
      t.decimal :total
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
