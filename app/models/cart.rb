class Cart < ActiveRecord::Base
  has_attached_file :invoice
  do_not_validate_attachment_file_type :invoice

  belongs_to :customer, validate: true
  belongs_to :coupon

  has_many :transitions, class_name: "CartTransition", autosave: false
  has_many :products, through: :cart_products
  has_many :cart_products

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :coupon

  validates_presence_of :customer

  #before_create :set_reference_number
  #before_create :set_status
  #before_create :set_total
  #before_create :set_shipping_fee

  def state_machine
    @state_machine ||= CartStateMachine.new(self, transition_class: CartTransition, association_name: :transitions)
  end

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state, to: :state_machine

  CREATED = 'created'
  PAID = 'paid'
  SHIPPING_FEE = 8.57

  def has_coupon?
    !coupon.nil?
  end

  def self.transition_class
    CartTransition
  end

  def self.initial_state
    :pending
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
