class AddAdditionalPropsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :gluten_free, :boolean
    add_column :products, :vegan, :boolean
    add_column :products, :organic, :boolean
    add_column :products, :non_gmo, :boolean
  end
end
