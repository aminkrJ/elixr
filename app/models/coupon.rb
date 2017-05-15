class Coupon < ActiveRecord::Base
  attr_accessor :shipping_fee, :price, :quantity

  def gst
    0
  end

  def total
    subtotal + shipping_fee
  end

  def subtotal
    (price + gst) * quantity
  end

  def redeem
    if rule == 'DFQM2' # delivery free quantity more than 2
      self.shipping_fee = 0 if quantity > 2
    end
  end

  def redeemable?
    true
  end

  def apply(options)
    self.shipping_fee, self.price, self.quantity = options[:shipping_fee], options[:price], options[:quantity]
  end

end
