class NutritionFact < ActiveRecord::Base
  has_many :ingredients, through: :ingredient_nutrition_facts
  has_many :intakes
  accepts_nested_attributes_for :intakes, allow_destroy: true, reject_if: :all_blank
  acts_as_tree order: 'name'
end
