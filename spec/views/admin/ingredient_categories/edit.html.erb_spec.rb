require 'rails_helper'

RSpec.describe "admin/ingredient_categories/edit", type: :view do
  before(:each) do
    @admin_ingredient_category = assign(:admin_ingredient_category, Admin::IngredientCategory.create!(
      :title => "MyString",
      :color => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit admin_ingredient_category form" do
    render

    assert_select "form[action=?][method=?]", admin_ingredient_category_path(@admin_ingredient_category), "post" do

      assert_select "input#admin_ingredient_category_title[name=?]", "admin_ingredient_category[title]"

      assert_select "input#admin_ingredient_category_color[name=?]", "admin_ingredient_category[color]"

      assert_select "input#admin_ingredient_category_description[name=?]", "admin_ingredient_category[description]"
    end
  end
end
