require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "email must be present" do
    customer = build :customer, email: nil
    expect(customer.valid?).to be_falsey
  end
end
