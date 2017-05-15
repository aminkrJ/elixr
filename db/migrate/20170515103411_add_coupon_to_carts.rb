class AddCouponToCarts < ActiveRecord::Migration
  def change
    add_reference :carts, :coupon, index: true, foreign_key: true
  end
end
