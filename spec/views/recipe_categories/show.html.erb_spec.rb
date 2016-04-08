require 'rails_helper'

RSpec.describe "recipe_categories/show", type: :view do
  before(:each) do
    @recipe_category = assign(:recipe_category, recipeCategory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
