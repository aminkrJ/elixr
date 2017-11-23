class AddMoreFieldsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :short_description, :string
  end
end
