require 'rails_helper'

RSpec.describe "ingredient_categories/edit", type: :view do
  before(:each) do
    @ingredient_category = assign(:ingredient_category, IngredientCategory.create!())
  end

  it "renders the edit ingredient_category form" do
    render

    assert_select "form[action=?][method=?]", ingredient_category_path(@ingredient_category), "post" do
    end
  end
end
