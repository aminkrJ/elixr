class Cart < ActiveRecord::Base
  has_attached_file :invoice
  do_not_validate_attachment_file_type :invoice

  belongs_to :customer, validate: true
  has_one :coupon

  accepts_nested_attributes_for :customer

  validates_presence_of :customer

  before_create :set_reference_number
  before_create :set_status
  before_create :set_total

  CREATED = 'created'
  PAID = 'paid'
  SHIPPING_FEE = 8.57

  def has_coupon?
    !coupon.nil?
  end

  private

  def set_status
    self.status = Cart::CREATED
  end

  def total_after_discount
    total_before_discount * (self.coupon.amount / 100)
  end

  def total_before_discount
    self.quantity * self.price
  end

  def set_total
    self.total = if has_coupon?
                   (total_after_discount + SHIPPING_FEE).round(2)
                 else
                   (total_before_discount + SHIPPING_FEE).round(2)
                 end
  end

  def set_reference_number
    self.reference_number = loop do
      random_token = SecureRandom.hex
      break random_token unless self.class.exists?(reference_number: random_token)
    end
  end
end
