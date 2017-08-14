class CartStateMachine
  include Statesman::Machine

  state :pending, initial: true
  state :purchased
  state :shipped
  state :cancelled
  state :failed
  state :refunded

  transition from: :pending,      to: [:purchased, :cancelled]
  transition from: :purchased,    to: [:shipped, :failed]
  transition from: :shipped,      to: :refunded

  guard_transition(to: :purchased) do |cart|
    cart.has_a_shipping_address?
  end

  before_transition(to: :purchased) do |cart, transition|
    # do the payment
  end

  after_transition(to: :purchased) do |cart, transition|
    # send receipt
  end
end
