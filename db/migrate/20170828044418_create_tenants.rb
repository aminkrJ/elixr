class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :domain
      t.string :uuid

      t.timestamps null: false
    end
  end
end
