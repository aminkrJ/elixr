class RenameDropoffLocationsToVenues < ActiveRecord::Migration
  def change
    rename_table :dropoff_locations, :venues
  end
end
