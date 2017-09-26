class CampaignSubscriber < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :subscriber
end
