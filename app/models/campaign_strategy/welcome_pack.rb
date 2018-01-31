module CampaignStrategy
  class WelcomePack
    attr_accessor :campaign, :subscriber

    def initialize(campaign, subscriber)
      @campaign = campaign
      @subscriber = subscriber
    end

    def launch
      CampaignMailer.welcome(campaign.id, subscriber.id, Tenant.current.id).deliver_later
    end
  end
end
