class AddAmountToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :amount, :integer
    add_column :ingredients, :unit_id, :integer
  end
end
