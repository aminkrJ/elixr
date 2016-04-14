require 'rails_helper'

RSpec.describe "intakes/show", type: :view do
  before(:each) do
    @intake = assign(:intake, Intake.create!(
      :age_from => 1,
      :age_to => 2,
      :amount => 1.5,
      :period => "Period"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Period/)
  end
end
