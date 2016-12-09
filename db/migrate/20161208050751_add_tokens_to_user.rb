class AddTokensToUser < ActiveRecord::Migration
  def change
    add_column :users, :tokens, :json
  end
end
