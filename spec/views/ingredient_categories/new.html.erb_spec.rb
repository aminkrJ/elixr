require 'rails_helper'

RSpec.describe "ingredient_categories/new", type: :view do
  before(:each) do
    assign(:ingredient_category, IngredientCategory.new())
  end

  it "renders new ingredient_category form" do
    render

    assert_select "form[action=?][method=?]", ingredient_categories_path, "post" do
    end
  end
end
