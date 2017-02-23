class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :stripe_customer_id
      t.string :address_line1
      t.string :address_line2
      t.string :address_city
      t.string :address_country
      t.string :address_zip
      t.string :address_state
      t.string :name_on_card

      t.timestamps null: false
    end
  end
end
