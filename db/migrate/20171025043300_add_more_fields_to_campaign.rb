class AddMoreFieldsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :description, :string
    add_column :campaigns, :short_description, :string
    add_column :campaigns, :active, :boolean
  end
end
