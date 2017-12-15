require 'rails_helper'

RSpec.describe Postcode, type: :model do
  describe "#pickup" do
    it "creates a new postcode" do
      postcode = Postcode.pickup "2012"
      expect(postcode.postcode).to eq("2012")
      expect(postcode.delivery_option).to eq("pickup")
      expect(postcode.count).to eq(1)

      postcode = Postcode.pickup "2012"
      expect(postcode.count).to eq(2)

      postcode = Postcode.delivery "2012"
      expect(postcode.delivery_option).to eq("delivery")
      expect(postcode.count).to eq(1)
    end
  end
end
