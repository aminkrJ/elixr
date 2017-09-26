class AddAppNameToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :app_name, :string
  end
end
