require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:stripe_helper) { StripeMock.create_test_helper }

  it "creates a stripe customer and charge" do
    StripeMock.start
    customer = Stripe::Customer.create({
      email: 'johnny@appleseed.com',
      card: stripe_helper.generate_card_token
    })
    expect(customer.email).to eq('johnny@appleseed.com')

    charge = Stripe::Charge.create(
      customer: customer,
      amount: (95.5.to_r*100).to_i,
      description: 'good order from a good customer',
      currency: 'aud'
    )
    StripeMock.stop
  end
end
