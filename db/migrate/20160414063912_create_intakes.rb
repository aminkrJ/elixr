class CreateIntakes < ActiveRecord::Migration
  def change
    create_table :intakes do |t|
      t.integer :age_from
      t.integer :age_to
      t.decimal :amount, precision: 19, scale: 2
      t.string  :period
      t.integer :unit_id
      t.integer :nutrition_fact_id

      t.timestamps null: false
    end
  end
end
