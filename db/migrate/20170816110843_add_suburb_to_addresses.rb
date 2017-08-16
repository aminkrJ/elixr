class AddSuburbToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :suburb, :string
  end
end
