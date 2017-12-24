class AddDiscountToCart < ActiveRecord::Migration
  def change
    add_column :carts, :discount, :decimal, precision: 8,  scale: 2, default: 0
  end
end
