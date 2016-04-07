require 'rails_helper'

RSpec.describe "cooks/index", type: :view do
  before(:each) do
    assign(:cooks, [
      Cook.create!(
        :name => "Name"
      ),
      Cook.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of cooks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
