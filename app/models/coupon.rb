class Coupon < ActiveRecord::Base
  has_many :carts
end
