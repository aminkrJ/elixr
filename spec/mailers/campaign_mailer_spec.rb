require "rails_helper"

RSpec.describe CampaignMailer, type: :mailer do
  describe "dispatch pdf" do
    before(:each) do
      @tenant = create :tenant, smtp_password: "passwordhash"
      Apartment::Tenant.switch!(@tenant.domain)
    end

    let(:campaign_subscriber) { create :campaign_subscriber }

    it "sends pdf email" do
      allow(campaign_subscriber.campaign.pdf).to receive(:exists?).and_return(false) # I don't know how to test files in s3 yet
      mail = described_class.send_pdf(campaign_subscriber.campaign, campaign_subscriber.subscriber).deliver_now

      expect(mail.to).to eq([campaign_subscriber.subscriber.email])
      expect(mail.subject).to eq(campaign_subscriber.campaign.pdf_title)
    end

    it "has an attachment" do
      #TODO
    end
  end
end
