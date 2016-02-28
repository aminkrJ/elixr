class RemoveCategoryFromNutritionFactsTable < ActiveRecord::Migration
  def change
    remove_column :nutrition_facts, :category
  end
end
