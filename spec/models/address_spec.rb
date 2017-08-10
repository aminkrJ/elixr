require 'rails_helper'

RSpec.describe Address, type: :model do
  it "delivers in Australia" do
    address = create :address
    expect(address.country).to eq("Australia")
  end

  it "suite_apt can be empty" do
    address = build :address, suite_apt: nil
    expect(address).to be_valid
  end

  describe "other fields must be there" do
    it "#street_address" do
      address = build :address, street_address: nil
      expect(address).to have(1).errors_on(:street_address)
    end

    it "#city" do
      address = build :address, city: nil
      expect(address).to have(1).errors_on(:city)
    end

    it "#state" do
      address = build :address, state: nil
      expect(address).to have(1).errors_on(:state)
    end

    it "#zip" do
      address = build :address, zip: nil
      expect(address).to have(1).errors_on(:zip)
    end
  end
end
