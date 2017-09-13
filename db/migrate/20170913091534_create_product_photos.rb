class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
      t.attachment :photo
      t.string :photo_type
      t.json :photo_meta
      t.timestamps null: false
    end
  end
end
