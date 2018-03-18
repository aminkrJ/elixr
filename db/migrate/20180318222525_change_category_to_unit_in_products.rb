class ChangeCategoryToUnitInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :category, :unit
  end
end
