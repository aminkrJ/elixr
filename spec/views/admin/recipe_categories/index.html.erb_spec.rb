require 'rails_helper'

RSpec.describe "recipe_categories/index", type: :view do
  before(:each) do
    assign(:recipe_categories, [
      RecipeCategory.create!(),
      RecipeCategory.create!()
    ])
  end

  it "renders a list of recipe_categories" do
    render
  end
end
