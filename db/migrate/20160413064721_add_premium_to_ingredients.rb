class AddPremiumToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :premium, :boolean, default: false
  end
end
