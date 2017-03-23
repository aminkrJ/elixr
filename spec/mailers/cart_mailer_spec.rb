require "rails_helper"

RSpec.describe CartMailer, type: :mailer do
  describe "dispatch invoice" do
    before do
      customer = create :customer, email: 'test@test.com'
      @cart = create :cart, customer: customer
    end

    it "sends to cart customer" do
      mail = described_class.dispatch_invoice(@cart).deliver_now
      expect(mail.to).to eq(["test@test.com"])
    end

    it "has an attachment" do
      #TODO figure it out!
    end
  end
end
