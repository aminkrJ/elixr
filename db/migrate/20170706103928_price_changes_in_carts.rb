class PriceChangesInCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :price
    remove_column :carts, :quantity

    add_column :carts, :subtotal, :decimal, precision: 8, scale: 2
  end
end
