class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :how_to_cook
      t.integer :difficulty

      t.timestamps null: false
    end
  end
end
