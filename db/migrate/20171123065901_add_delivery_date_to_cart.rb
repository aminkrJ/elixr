class AddDeliveryDateToCart < ActiveRecord::Migration
  def change
    add_column :carts, :delivery_at, :datetime
  end
end
