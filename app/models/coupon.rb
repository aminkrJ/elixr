class Coupon < ActiveRecord::Base
  attr_accessor :shipping_fee, :total, :quantity
  attr_reader :discount

  def redeemable?
    (rule == 'DFQM2' && quantity > 2) ? true : false
  end

  def apply(options)
    self.shipping_fee, self.total, self.quantity = options[:shipping_fee], options[:total], options[:quantity]
    case rule
    when 'DFQM2'
      if redeemable?
        @discount = self.shipping_fee
        self.shipping_fee = 0
      end
    end
  end
end
