class AddPricePerGramToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :price_per_gram, :decimal, :precision => 6, :scale => 4
  end
end
