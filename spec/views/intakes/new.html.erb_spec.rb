require 'rails_helper'

RSpec.describe "intakes/new", type: :view do
  before(:each) do
    assign(:intake, Intake.new(
      :age_from => 1,
      :age_to => 1,
      :amount => 1.5,
      :period => "MyString"
    ))
  end

  it "renders new intake form" do
    render

    assert_select "form[action=?][method=?]", intakes_path, "post" do

      assert_select "input#intake_age_from[name=?]", "intake[age_from]"

      assert_select "input#intake_age_to[name=?]", "intake[age_to]"

      assert_select "input#intake_amount[name=?]", "intake[amount]"

      assert_select "input#intake_period[name=?]", "intake[period]"
    end
  end
end
