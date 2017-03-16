require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "returns error without customer" do
    cart = build :cart, customer: nil
    expect(cart).to have(1).errors_on(:customer)
  end
end
