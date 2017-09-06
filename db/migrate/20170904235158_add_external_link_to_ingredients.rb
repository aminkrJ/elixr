class AddExternalLinkToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :external_link, :string
  end
end
