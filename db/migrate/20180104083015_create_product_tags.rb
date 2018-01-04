class CreateProductTags < ActiveRecord::Migration
  def change
    create_table :product_tags do |t|
      t.references :tag, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps null: false
    end
  end
end
