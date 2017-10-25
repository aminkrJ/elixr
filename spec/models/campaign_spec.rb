require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe "has subscriber's count" do
    it "inc subscribers" do
      campaign = create :campaign
      campaign.subscribers << create(:subscriber)

      expect(campaign.campaign_subscribers_count).to eq(1)
    end
  end
end
