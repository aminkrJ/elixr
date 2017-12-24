require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe "rule1" do
    it "no shipping fee for orders more than two" do
      coupon = create :coupon, rule: 'DFQM2'
      cart = create :cart, total: 40, coupon: coupon

      coupon.apply!({ shipping_fee: 10, quantity: 3, total: 40 })

      expect(cart.coupon.discount).to eq 10
      expect(cart.coupon.total).to eq 40
      expect(cart.coupon.shipping_fee).to eq 0
    end
  end
end
