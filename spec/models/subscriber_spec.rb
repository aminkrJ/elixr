require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  it "creates a subscriber" do
    expect{Subscriber.create(full_name: "Amin Karaji")}.to_not raise_error
  end
end
