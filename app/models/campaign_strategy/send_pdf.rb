module CampaignStrategy
  class SendPdf
    attr_accessor :campaign, :subscriber

    def initialize(campaign, subscriber)
      @campaign = campaign
      @subscriber = subscriber
    end

    def launch
-     CampaignMailer.delay.send_pdf(campaign, subscriber)
    end
  end
end
