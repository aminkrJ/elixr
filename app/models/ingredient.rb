class Ingredient < ActiveRecord::Base
  accepts_nested_attributes_for :nutrition_facts
  has_many :nutrition_facts, through: :ingredient_nutrition_facts
end
