class AddMoreToProducts < ActiveRecord::Migration
  def change
    add_column :products, :weight, :integer
    add_column :products, :serving_idea, :text
    add_column :products, :nutrition_fact, :text
    add_column :products, :ingredients, :string
  end
end
