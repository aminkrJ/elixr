class CampaignSubscriber < ActiveRecord::Base
  belongs_to :campaign, counter_cache: true
  belongs_to :subscriber

  after_create :launch_campaign

  private

  def launch_campaign
    campaign.launch(subscriber)
  end
end
