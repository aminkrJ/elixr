class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :amount
      t.boolean :active
      t.string :description
      t.integer :redemption_limit
      t.string :rule

      t.timestamps null: false
    end
  end
end
