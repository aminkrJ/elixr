class AddMoreInfoToDropoffLocations < ActiveRecord::Migration
  def change
    add_column :dropoff_locations, :capacity_per_day, :integer
    add_column :dropoff_locations, :phone, :string
    add_column :dropoff_locations, :short_description, :string
    add_column :dropoff_locations, :description, :text
  end
end
