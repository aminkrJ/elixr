class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :suite_apt
      t.string :city
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps null: false
    end
  end
end
