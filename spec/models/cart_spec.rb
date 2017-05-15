require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "saves cart without coupon" do
    cart = build :cart
    expect(cart.save).to be_truthy
  end

  it "returns error without customer" do
    cart = build :cart, customer: nil
    expect(cart).to have(1).errors_on(:customer)
  end

  it "generates reference number" do
    expect(create(:cart).reference_number).not_to be_empty
  end

  it "sets status" do
    expect(create(:cart).status).to eq(Cart::CREATED)
  end

  it "sets total" do
    expect(create(:cart, quantity: 2).total).to eq(19.98)
  end
end
