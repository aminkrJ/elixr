require 'rails_helper'

RSpec.describe "ingredient_categories/index", type: :view do
  before(:each) do
    assign(:ingredient_categories, [
      IngredientCategory.create!(),
      IngredientCategory.create!()
    ])
  end

  it "renders a list of ingredient_categories" do
    render
  end
end
