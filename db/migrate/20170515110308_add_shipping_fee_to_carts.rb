class AddShippingFeeToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :shipping_fee, :decimal, precision: 10, scale: 2
  end
end
