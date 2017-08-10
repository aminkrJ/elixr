class RemoveStateFromCartAndAddressFromCustomer < ActiveRecord::Migration
  def change
    remove_column :carts, :status

    remove_column :customers, :stripe_customer_id
    remove_column :customers, :address
    remove_column :customers, :city
    remove_column :customers, :country
    remove_column :customers, :suburb
    remove_column :customers, :state
    remove_column :customers, :postcode
    remove_column :customers, :name_on_card
    remove_column :customers, :status

  end
end
