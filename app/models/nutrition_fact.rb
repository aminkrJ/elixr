class NutritionFact < ActiveRecord::Base
  has_many :ingredients, through: :ingredient_nutrition_facts
  acts_as_tree order: 'name'
end
