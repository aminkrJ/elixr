module CampaignStrategy
  class WelcomePack
    attr_accessor :campaign, :subscriber

    def initialize(campaign, subscriber)
      @campaign = campaign
      @subscriber = subscriber
    end

    def launch
      # TODO
    end
  end
end
