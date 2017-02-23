class AddMoreFieldsToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :reference_number, :string
    add_column :carts, :stripe_token, :string
    add_column :carts, :status, :string
  end
end
