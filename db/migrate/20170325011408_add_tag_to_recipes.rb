class AddTagToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :tag, :string
  end
end
