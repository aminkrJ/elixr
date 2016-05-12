require 'rails_helper'

RSpec.describe "intakes/index", type: :view do
  before(:each) do
    assign(:intakes, [
      Intake.create!(
        :age_from => 1,
        :age_to => 2,
        :amount => 1.5,
        :period => "Period"
      ),
      Intake.create!(
        :age_from => 1,
        :age_to => 2,
        :amount => 1.5,
        :period => "Period"
      )
    ])
  end

  it "renders a list of intakes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Period".to_s, :count => 2
  end
end
