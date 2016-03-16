class AddTagsForIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :tags, :string
  end
end
