class CampaignSubscriber < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :subscriber

  after_create :launch_campaign

  private

  def launch_campaign
    campaign.launch(subscriber)
  end
end
