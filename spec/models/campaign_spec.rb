require 'rails_helper'

RSpec.describe Campaign, type: :model do
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
