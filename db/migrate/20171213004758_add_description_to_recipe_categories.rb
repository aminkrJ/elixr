class AddDescriptionToRecipeCategories < ActiveRecord::Migration
  def change
    add_column :recipe_categories, :short_description, :string
    add_column :recipe_categories, :description, :text
  end
end
