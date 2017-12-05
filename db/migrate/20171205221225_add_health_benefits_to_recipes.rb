class AddHealthBenefitsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :health_benefits, :text
  end
end
