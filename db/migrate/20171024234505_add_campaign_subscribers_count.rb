class AddCampaignSubscribersCount < ActiveRecord::Migration
  def up
    add_column :campaigns, :campaign_subscribers_count, :integer, :default => 0

    Campaign.reset_column_information

    Campaign.all.each do |c|
      Campaign.update_counters c.id, :campaign_subscribers_count => c.campaign_subscribers.length
    end
  end

  def down
    remove_column :campaigns, :campaign_subscribers_count
  end
end
