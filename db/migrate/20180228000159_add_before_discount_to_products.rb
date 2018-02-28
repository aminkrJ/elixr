class AddBeforeDiscountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :before_discount_price, :integer, default: 0
  end
end
