require "rails_helper"

describe SubscribersController do
  render_views
  let(:valid_subscriber) { {full_name: "John Foo", email: "john.foo@example.com"} }


  it "create a new subscriber" do
    expect {
      post :create, { subscriber: valid_subscriber }
    }.to change(Subscriber, :count).by(1)
  end

end
