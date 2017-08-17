require "rails_helper"

RSpec.describe CartMailer, type: :mailer do
  describe "dispatch invoice" do
    let(:customer) { create :customer, email: 'test@test.com' }
    let(:cart_product) { create :cart_product, cart: create(:cart, customer: customer) }

    it "sends to cart customer" do
      allow(cart_product.cart.invoice).to receive(:exists?).and_return(false) # I don't know how to test files in s3 yet
      mail = described_class.dispatch_invoice(cart_product.cart).deliver_now
      expect(mail.to).to eq(["test@test.com"])
    end

    it "has an attachment" do
      #TODO
    end
  end
end
