class CreateDropoffLocations < ActiveRecord::Migration
  def change
    create_table :dropoff_locations do |t|
      t.string :address
      t.string :suburb

      t.index :suburb

      t.timestamps null: false
    end
  end
end
