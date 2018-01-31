module CampaignStrategy
  class SendPdf
    attr_accessor :campaign, :subscriber

    def initialize(campaign, subscriber)
      @campaign = campaign
      @subscriber = subscriber
    end

    def launch
      CampaignMailer.send_pdf(campaign.id, subscriber.id, Tenant.current.id).deliver_later
    end
  end
end
