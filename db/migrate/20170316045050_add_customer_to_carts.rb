class AddCustomerToCarts < ActiveRecord::Migration
  def change
    add_reference :carts, :customer, index: true, foreign_key: true
  end
end
