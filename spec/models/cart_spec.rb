require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "saves cart without coupon" do
    cart = build :cart
    expect(cart.save).to be_truthy
  end

  describe "#dispatch_invoice" do
    subject { create(:cart_product).cart }

    it "sends cart invoice" do
      expect {
        subject.dispatch_invoice
      }.to change { Sidekiq::Worker.jobs.size }.by(1)
    end
  end

  describe "#pay" do
    let(:cart) { build :cart, total: 10 }

    let(:stripe_helper) { StripeMock.create_test_helper }
    before { StripeMock.start }
    after { StripeMock.stop }

    it "returns Stripe charge" do
      expect(cart.pay).to be_truthy
    end

    it "raises error when card is declined" do
      StripeMock.prepare_card_error(:card_declined)

      expect { Stripe::Charge.create(amount: 1, currency: 'usd') }.to raise_error {|e|
        expect(e).to be_a Stripe::CardError
        expect(e.http_status).to eq(402)
        expect(e.code).to eq('card_declined')
      }
    end
  end

  describe "#has_a_shipping_address" do
    let(:customer) { create :customer }

    it "return true when there is an address" do
      allow(customer).to receive(:addresses).and_return([double(:address)])

      cart = build :cart, customer: customer
      expect(cart.has_a_shipping_address?).to be_truthy
    end

    it "return false when there is no address" do
      cart = build :cart, customer: customer
      expect(cart.has_a_shipping_address?).to be_falsey
    end
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
end
