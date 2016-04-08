class AddCookRecipeCategorySourceToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :cook_id, :integer
    add_column :recipes, :recipe_category_id, :integer
    add_column :recipes, :url, :string
  end
end
