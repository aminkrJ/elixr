require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  it "creates a subscriber without email" do
    expect(build(:subscriber, full_name: "Amin Karaji", email: nil).valid?).to be_falsy
  end

  it "creates a subscriber with invalid email" do
    expect(build(:subscriber, full_name: "Amin Karaji", email: "a@b").valid?).to be_falsy
  end
end
