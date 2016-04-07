require 'rails_helper'

RSpec.describe "ingredient_categories/show", type: :view do
  before(:each) do
    @ingredient_category = assign(:ingredient_category, IngredientCategory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
