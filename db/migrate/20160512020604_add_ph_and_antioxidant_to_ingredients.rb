class AddPhAndAntioxidantToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :ph, :integer
    add_column :ingredients, :antioxidant, :boolean
  end
end
