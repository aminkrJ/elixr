class Ingredient < ActiveRecord::Base
  has_many :ingredient_nutrition_facts
  has_many :nutrition_facts, through: :ingredient_nutrition_facts
  accepts_nested_attributes_for :ingredient_nutrition_facts, allow_destroy: true
end
