class AddCookIngredientCategorySourceToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :cook_id, :integer
    add_column :recipes, :ingredient_category_id, :integer
    add_column :recipes, :url, :string
  end
end
