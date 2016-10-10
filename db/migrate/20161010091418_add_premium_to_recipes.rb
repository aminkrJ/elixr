class AddPremiumToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :premium, :boolean, default: false
  end
end
