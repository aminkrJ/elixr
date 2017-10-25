class AddCampaignStrategyToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :strategy, :string
  end
end
