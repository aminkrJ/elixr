class AddParentIdToNutritionFactsTable < ActiveRecord::Migration
  def change
    add_column :nutrition_facts, :parent_id, :integer
  end
end
