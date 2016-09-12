class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :full_name
      t.string :subscribed_to

      t.timestamps null: false
    end
  end
end
