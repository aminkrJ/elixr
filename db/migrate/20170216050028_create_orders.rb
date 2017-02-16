class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :cart, index: true, foreign_key: true
      t.string :stripe_token

      t.timestamps null: false
    end
  end
end
