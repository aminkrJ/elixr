class CartStateMachine
  include Statesman::Machine

  state :pending, initial: true
  state :checking_out
  state :purchased
  state :shipped
  state :cancelled
  state :failed
  state :refunded

  transition from: :pending,      to: [:checking_out, :cancelled]
  transition from: :checking_out, to: [:purchased, :cancelled]
  transition from: :purchased,    to: [:shipped, :failed]
  transition from: :shipped,      to: :refunded

  guard_transition(to: :checking_out) do |cart|
    # in stock
  end

  before_transition(from: :checking_out, to: :cancelled) do |cart, transition|
    # reallocated the stock
  end

  before_transition(to: :purchased) do |cart, transition|
    # do the payment
  end

  after_transition(to: :purchased) do |cart, transition|
    # send receipt
  end
end
