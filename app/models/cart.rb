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
  accepts_nested_attributes_for :cart_products

  validates_presence_of :customer
  validates_presence_of :cart_products

  before_create :set_reference_number

  def state
    @state ||= CartStateMachine.new(self, transition_class: CartTransition, association_name: :transitions)
  end
  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state, to: :state


  def has_a_shipping_address?
    self.customer.addresses.first
  end

  def has_coupon?
    !coupon.nil?
  end

  private

  def set_reference_number
    self.reference_number = loop do
      random_token = SecureRandom.hex
      break random_token unless self.class.exists?(reference_number: random_token)
    end
  end
end
