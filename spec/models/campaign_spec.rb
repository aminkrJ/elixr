require 'rails_helper'

RSpec.describe Campaign, type: :model do

  describe "#launch" do
    it "launch campaign only if there is a strategy" do
      campaign = create :campaign, strategy: nil
      campaign.subscribers << create(:subscriber)
      #TODO
    end
  end

  describe "has subscriber's count" do
    it "inc/dec subscribers" do
      campaign = create :campaign
      campaign.subscribers << create(:subscriber)

      expect(campaign.campaign_subscribers_count).to eq(1)

      # TODO we have to figure out what to do with deletion
      #campaign.subscribers.first.delete
      #expect(campaign.campaign_subscribers_count).to eq(0)
    end
  end
end
