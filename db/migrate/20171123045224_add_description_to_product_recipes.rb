class AddDescriptionToProductRecipes < ActiveRecord::Migration
  def change
    add_column :product_recipes, :description, :string
  end
end
