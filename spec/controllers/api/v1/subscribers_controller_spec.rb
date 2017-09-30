require "rails_helper"

describe Api::V1::SubscribersController do
  render_views

  let(:valid_subscriber) { {full_name: "John Foo", email: "john.foo@example.com" } }
  let(:campaign) { create :campaign }

  it "create a new subscriber" do
    expect {
      post :create, campaign_id: campaign.id, subscriber: valid_subscriber
    }.to change(Subscriber, :count).by(1)
  end

end
