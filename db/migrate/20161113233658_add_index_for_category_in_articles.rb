class AddIndexForCategoryInArticles < ActiveRecord::Migration
  def change
    add_index :articles, :category
  end
end
