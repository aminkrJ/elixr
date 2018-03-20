class AddMetaKeywordsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :meta_keywords, :string
  end
end
