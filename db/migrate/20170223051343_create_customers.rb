class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :stripe_customer_id
      t.string :address
      t.string :city
      t.string :country
      t.string :postcode
      t.string :suburb
      t.string :state
      t.string :name_on_card

      t.timestamps null: false
    end
  end
end
