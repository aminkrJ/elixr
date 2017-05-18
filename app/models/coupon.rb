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

  def redeemable?
    (rule == 'DFQM2' && quantity > 2) ? true : false
  end

  def apply(options)
    self.shipping_fee, self.price, self.quantity = options[:shipping_fee], options[:price], options[:quantity]
    case rule
    when 'DFQM2'
      self.shipping_fee = 0 if redeemable?
    end
  end
end
