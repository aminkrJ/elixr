class AddServingSizeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :serving_size, :integer
  end
end
