class AddColorToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :color, :string
  end
end
