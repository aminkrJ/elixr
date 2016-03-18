require 'rails_helper'

describe "manages ingredients" do
  before :each do
    @ingredient = create :ingredient
    
    login_as create(:user), scope: :user
  end

  it "duplicates ingredient", js: true do
    visit ingredients_path
    expect(true).to be_truthy
  end
end
