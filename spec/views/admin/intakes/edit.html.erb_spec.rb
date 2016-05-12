require 'rails_helper'

RSpec.describe "intakes/edit", type: :view do
  before(:each) do
    @intake = assign(:intake, Intake.create!(
      :age_from => 1,
      :age_to => 1,
      :amount => 1.5,
      :period => "MyString"
    ))
  end

  it "renders the edit intake form" do
    render

    assert_select "form[action=?][method=?]", intake_path(@intake), "post" do

      assert_select "input#intake_age_from[name=?]", "intake[age_from]"

      assert_select "input#intake_age_to[name=?]", "intake[age_to]"

      assert_select "input#intake_amount[name=?]", "intake[amount]"

      assert_select "input#intake_period[name=?]", "intake[period]"
    end
  end
end
