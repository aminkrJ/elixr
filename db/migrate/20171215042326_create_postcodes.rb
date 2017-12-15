class CreatePostcodes < ActiveRecord::Migration
  def change
    create_table :postcodes do |t|
      t.string :postcode
      t.string :delivery_option
      t.integer :count

      t.timestamps null: false
    end
  end
end
