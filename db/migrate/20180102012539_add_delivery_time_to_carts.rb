class AddDeliveryTimeToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :delivery_time, :string
  end
end
