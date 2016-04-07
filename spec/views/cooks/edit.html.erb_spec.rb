require 'rails_helper'

RSpec.describe "cooks/edit", type: :view do
  before(:each) do
    @cook = assign(:cook, Cook.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit cook form" do
    render

    assert_select "form[action=?][method=?]", cook_path(@cook), "post" do

      assert_select "input#cook_name[name=?]", "cook[name]"
    end
  end
end
