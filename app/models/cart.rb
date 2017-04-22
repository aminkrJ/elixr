class Cart < ActiveRecord::Base
  has_attached_file :invoice
  do_not_validate_attachment_file_type :invoice

  belongs_to :customer, validate: true

  accepts_nested_attributes_for :customer

  validates_presence_of :customer

  before_create :set_reference_number
  before_create :set_status
  before_create :set_total

  CREATED = 'created'
  PAID = 'paid'
  SHIPPING_FEE = 8.57

  private

  def set_status
    self.status = Cart::CREATED
  end

  def set_total
    self.total = ((self.quantity * self.price) + SHIPPING_FEE).round(2)
  end

  def set_reference_number
    self.reference_number = loop do
      random_token = SecureRandom.hex
      break random_token unless self.class.exists?(reference_number: random_token)
    end
  end
end
