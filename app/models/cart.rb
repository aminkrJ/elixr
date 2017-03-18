class Cart < ActiveRecord::Base
  belongs_to :customer, validate: true

  accepts_nested_attributes_for :customer

  validates_presence_of :customer

  before_create :set_reference_number
  before_create :set_status
  before_create :set_total

  CREATED = 'created'
  PAID = 'paid'

  private

  def set_status
    self.status = Cart::CREATED
  end

  def set_total
    self.total = self.quantity * self.price
  end

  def set_reference_number
    self.reference_number = loop do
      random_token = SecureRandom.hex
      break random_token unless self.class.exists?(reference_number: random_token)
    end
  end
end
