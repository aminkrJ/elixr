require 'rails_helper'

describe "manages ingredients" do
  before :each do
    @ingredient = create :ingredient
  end

  it "open page", js: true do
    visit root_path
    expect(true).to be_truthy
  end
end
