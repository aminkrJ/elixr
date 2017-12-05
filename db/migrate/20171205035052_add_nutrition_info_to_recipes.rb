class AddNutritionInfoToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :nutrition_info, :text
  end
end
