class AddPreferencesToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :organic, :boolean, default: false
    add_column :carts, :activated_nuts, :boolean, default: false
    add_column :carts, :vegan, :boolean, default: false
  end
end
