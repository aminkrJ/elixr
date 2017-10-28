module CampaignStrategy
  class WelcomePack
    attr_accessor :campaign, :subscriber

    def initialize(campaign, subscriber)
      @campaign = campaign
      @subscriber = subscriber
    end

    def launch
      CampaignMailer.delay.welcome(campaign.id, subscriber.id, Tenant.current.id)
    end
  end
end
