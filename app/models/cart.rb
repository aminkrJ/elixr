class Cart < ActiveRecord::Base
  has_attached_file :invoice
  do_not_validate_attachment_file_type :invoice

  belongs_to :customer, validate: true
  belongs_to :coupon

  accepts_nested_attributes_for :customer

  validates_presence_of :customer

  before_create :set_reference_number
  before_create :set_status
  before_create :set_total
  before_create :set_shipping_fee

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

  def gst
    0
  end

  def subtotal
    (self.price + gst) * quantity
  end

  def set_total
    self.total = subtotal + SHIPPING_FEE
  end

  def set_shipping_fee
    self.shipping_fee = SHIPPING_FEE
  end

  def set_reference_number
    self.reference_number = loop do
      random_token = SecureRandom.hex
      break random_token unless self.class.exists?(reference_number: random_token)
    end
  end
end
