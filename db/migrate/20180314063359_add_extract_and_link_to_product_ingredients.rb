class AddExtractAndLinkToProductIngredients < ActiveRecord::Migration
  def change
    add_column :product_ingredients, :extract, :boolean
    add_column :product_ingredients, :info_link, :string
  end
end
