class AddFirstnameLastnameToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :firstname, :string
    add_column :customers, :lastname, :string
    remove_column :customers, :fullname
  end
end
