class CreateCampaignSubscribers < ActiveRecord::Migration
  def change
    create_table :campaign_subscribers do |t|
      t.references :campaign, index: true
      t.references :subscriber, index: true

      t.timestamps null: false
    end
  end
end
