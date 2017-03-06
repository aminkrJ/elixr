class AddEmailAndFullnameForCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :fullname, :string
    add_column :customers, :email, :string
    add_column :customers, :status, :string
  end
end
