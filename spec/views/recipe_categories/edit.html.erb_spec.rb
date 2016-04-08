require 'rails_helper'

RSpec.describe "recipe_categories/edit", type: :view do
  before(:each) do
    @recipe_category = assign(:recipe_category, recipeCategory.create!())
  end

  it "renders the edit recipe_category form" do
    render

    assert_select "form[action=?][method=?]", recipe_category_path(@recipe_category), "post" do
    end
  end
end
