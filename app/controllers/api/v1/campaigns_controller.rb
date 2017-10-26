class Api::V1::CampaignsController < Api::V1::BaseController
  def index
    @campaigns = Campaign.order("campaign_subscribers_count DESC").all
  end
end
