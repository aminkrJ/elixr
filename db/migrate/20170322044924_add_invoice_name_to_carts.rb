class AddInvoiceNameToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :invoice_file_name, :string
  end
end
