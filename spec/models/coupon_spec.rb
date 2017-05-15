require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe "rule1" do
    it "no shipping fee for orders more than two" do
      coupon = create :coupon, rule: 'DFQM2'
      cart = create :cart, quantity: 3, price: 10, coupon: coupon

      coupon.apply({ shipping_fee: Cart::SHIPPING_FEE, quantity: cart.quantity, price: cart.price })
      coupon.redeem

      expect(cart.total).to eq(30 + Cart::SHIPPING_FEE)
      expect(cart.coupon.total).to eq(30)
    end
  end
end
