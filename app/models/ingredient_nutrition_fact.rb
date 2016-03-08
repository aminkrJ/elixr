class IngredientNutritionFact < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :nutrition_fact
  belongs_to :unit
end
