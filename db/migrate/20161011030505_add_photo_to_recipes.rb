class AddPhotoToRecipes < ActiveRecord::Migration
  def up
    add_attachment :recipes, :photo
  end

  def down
    remove_attachment :recipes, :photo
  end
end
