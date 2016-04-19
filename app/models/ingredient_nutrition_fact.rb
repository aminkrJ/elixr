class IngredientNutritionFact < ActiveRecord::Base
  include UnitConvertible

  belongs_to :ingredient
  belongs_to :nutrition_fact
  belongs_to :unit
end
