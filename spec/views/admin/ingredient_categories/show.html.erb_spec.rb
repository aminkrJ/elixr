require 'rails_helper'

RSpec.describe "admin/ingredient_categories/show", type: :view do
  before(:each) do
    @admin_ingredient_category = assign(:admin_ingredient_category, Admin::IngredientCategory.create!(
      :title => "Title",
      :color => "Color",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Description/)
  end
end
