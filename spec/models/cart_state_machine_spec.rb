require 'rails_helper'

RSpec.describe CartStateMachine, type: :model do
  let(:cart) { create :cart }

  it "cannot transit to purchased when cart has no shipping address" do
    expect{ cart.transition_to!(:purchased) }.to raise_error(Statesman::GuardFailedError)
  end
end
