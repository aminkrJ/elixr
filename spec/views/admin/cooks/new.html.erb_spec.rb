require 'rails_helper'

RSpec.describe "cooks/new", type: :view do
  before(:each) do
    assign(:cook, Cook.new(
      :name => "MyString"
    ))
  end

  it "renders new cook form" do
    render

    assert_select "form[action=?][method=?]", cooks_path, "post" do

      assert_select "input#cook_name[name=?]", "cook[name]"
    end
  end
end
