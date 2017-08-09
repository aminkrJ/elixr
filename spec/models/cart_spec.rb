require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "saves cart without coupon" do
    cart = build :cart
    expect(cart.save).to be_truthy
  end

  describe "#customer" do
    it "returns error without customer" do
      cart = build :cart, customer: nil
      expect(cart).to have(1).errors_on(:customer)
    end

    it "return error with invalid customer" do
      cart = build :cart, customer: build(:customer, email: nil)
      expect(cart.customer).to have(1).errors_on(:email)
      expect(cart).to_not be_valid
    end
  end

  it "returns error without customer" do
    cart = build :cart, customer: nil
    expect(cart).to have(1).errors_on(:customer)
  end

  it "generates reference number" do
    expect(create(:cart).reference_number).not_to be_empty
  end

  describe "#state_machine" do
    it "default state is pending" do
      expect(create(:cart).state.current_state).to eq("pending")
    end
  end

  it "sets total" do
    expect(create(:cart, quantity: 2).total).to eq(19.98)
  end
end
