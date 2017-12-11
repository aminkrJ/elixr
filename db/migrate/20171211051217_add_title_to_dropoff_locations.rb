class AddTitleToDropoffLocations < ActiveRecord::Migration
  def change
    add_column :dropoff_locations, :title, :string
  end
end
