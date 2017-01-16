class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.string :description
      t.boolean :light
      t.boolean :vegan
      t.boolean :raw
      t.boolean :gluten_free
      t.boolean :organic
      t.attachment :photo

      t.timestamps null: false
    end
  end
end
