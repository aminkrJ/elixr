module CampaignStrategy
  class SendPdf
    attr_accessor :campaign, :subscriber

    def initialize(campaign, subscriber)
      @campaign = campaign
      @subscriber = subscriber
    end

    def launch
-     CampaignMailer.delay.sendPdf(campaign, subscriber)
    end
  end
end
