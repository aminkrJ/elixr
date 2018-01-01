class Cart < ActiveRecord::Base
  has_attached_file :invoice
  do_not_validate_attachment_file_type :invoice

  belongs_to :customer, validate: true
  belongs_to :coupon

  has_many :cart_transitions, autosave: false
  has_many :products, through: :cart_products
  has_many :cart_products, dependent: :destroy

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :coupon
  accepts_nested_attributes_for :cart_products

  #validates_presence_of :customer

  #TODO for validation we have to convert to Sydney time
  #validates_date :delivery_at, after: :today, if: lambda { |cart| !cart.delivery_at.nil? }
  #validates_time :delivery_at, between: ['9:00am', '5:00pm'], if: lambda { |cart| !cart.delivery_at.nil? }

  validates_presence_of :cart_products, if: Proc.new { |cart| !cart.id.nil? }
  validates_presence_of :delivery_at, if: Proc.new { |cart| cart.state.current_state != "pending" }

  before_create :set_reference_number

  def state
    @state ||= CartStateMachine.new(self, transition_class: CartTransition)
  end
  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state, to: :state


  def has_a_shipping_address?
    self.customer.addresses.first
  end

  def has_coupon?
    !coupon.nil?
  end

  def dispatch_invoice
    CartMailer.delay.dispatch_invoice self.id, Tenant.current.id
  end

  def generate_invoice(pdf_html)
    doc_pdf = WickedPdf.new.pdf_from_string pdf_html

    Dir.mkdir(Rails.root.join('tmp/invoices')) unless File.exists?(Rails.root.join('tmp/invoices'))

    pdf_path = Rails.root.join('tmp/invoices', "#{self.reference_number}.pdf")

    File.open(pdf_path, 'wb') do |file|
      file << doc_pdf
    end

    return pdf_path
  end

  def pay
    stripe_customer = Stripe::Customer.create(
      email: self.customer.email,
      source: self.stripe_token
    )

    charge = Stripe::Charge.create(
      customer: stripe_customer.id,
      amount: (self.total.to_r*100).to_i,
      description: self.reference_number,
      currency: 'aud'
    )

    charge.paid

  rescue Stripe::CardError => e
    # Since it's a decline, Stripe::CardError will be caught
    false
  rescue Stripe::RateLimitError => e
    # Too many requests made to the API too quickly
    false
  rescue Stripe::InvalidRequestError => e
    # Invalid parameters were supplied to Stripe's API
    false
  rescue Stripe::AuthenticationError => e
    # Authentication with Stripe's API failed
    false
  rescue Stripe::APIConnectionError => e
    # Network communication with Stripe failed
    false
  rescue Stripe::StripeError => e
    # Display a very generic error to the user, and maybe send yourself an email
    errors.add :stripe, e.message
    false
  rescue => e
    # Something else happened, completely unrelated to Stripe
    false
  end

  private

  def set_reference_number
    self.reference_number = loop do
      random_token = SecureRandom.hex
      break random_token unless self.class.exists?(reference_number: random_token)
    end
  end
end
