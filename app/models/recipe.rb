class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_many :recipe_ingredients
  belongs_to :category, class_name: 'RecipeCategory'

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true, reject_if: :all_blank
end
