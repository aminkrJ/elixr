require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  describe '.recipes_ingredients' do
    before(:each) do
      @recipe1 = create :recipe
      @recipe2 = create :recipe
      ingredient1 = create :ingredient, name: "i1"
      ingredient2 = create :ingredient, name: "i2"
      ingredient3 = create :ingredient, name: "i3"

      create :recipe_ingredient, recipe: @recipe1, ingredient: ingredient1, description: 'ingredient1', amount: 100
      create :recipe_ingredient, recipe: @recipe1, ingredient: ingredient2, description: 'ingredient2', amount: 100
      create :recipe_ingredient, recipe: @recipe2, ingredient: ingredient2, description: 'ingredient2', amount: 100
      create :recipe_ingredient, recipe: @recipe2, ingredient: ingredient3, description: 'ingredient3', amount: 50
    end

    it "correct totals for each ingredient" do
      shopping_list = RecipeIngredient.recipes_ingredients([@recipe1.id, @recipe2.id])
      expect(shopping_list.first.name).to eql("i2")
      expect(shopping_list.first.total_amount).to eql(200)
      expect(shopping_list.second.name).to eql("i1")
      expect(shopping_list.second.total_amount).to eql(100)
      expect(shopping_list.third.name).to eql("i3")
      expect(shopping_list.third.total_amount).to eql(50)
    end
  end
end
