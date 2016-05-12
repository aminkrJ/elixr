require 'rails_helper'

RSpec.describe "recipe_categories/new", type: :view do
  before(:each) do
    assign(:recipe_category, recipeCategory.new())
  end

  it "renders new recipe_category form" do
    render

    assert_select "form[action=?][method=?]", recipe_categories_path, "post" do
    end
  end
end
