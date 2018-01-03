class Coupon < ActiveRecord::Base
  attr_accessor :shipping_fee, :total, :subtotal
  attr_reader :discount

  validates_presence_of :code

  has_many :carts

  def apply!(options)
    self.shipping_fee, self.total, self.subtotal = options[:shipping_fee], options[:total], options[:subtotal]

    redeemable?

    case rule
    when '10OFF'
      @discount = (self.subtotal * 0.1).round 2
      self.subtotal -= @discount
      self.total -= @discount
    when 'FDO50DF0'
        # for orders over $50 delivery fee is 0
        @discount = self.shipping_fee
        self.shipping_fee = 0
        self.total -= @discount
    end
  end

  private
  def redeemable?
    case rule
    when 'FDO50DF0'
      if self.subtotal < 50
        raise "Cannot be applied. The order subtotal must be over $50."
      end
    end
  end
end
