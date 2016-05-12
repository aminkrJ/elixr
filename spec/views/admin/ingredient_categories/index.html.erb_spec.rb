require 'rails_helper'

RSpec.describe "admin/ingredient_categories/index", type: :view do
  before(:each) do
    assign(:admin_ingredient_categories, [
      Admin::IngredientCategory.create!(
        :title => "Title",
        :color => "Color",
        :description => "Description"
      ),
      Admin::IngredientCategory.create!(
        :title => "Title",
        :color => "Color",
        :description => "Description"
      )
    ])
  end

  it "renders a list of admin/ingredient_categories" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
