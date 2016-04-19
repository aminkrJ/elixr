class IngredientNutritionFact < ActiveRecord::Base
  include UnitConvertible

  scope :order_by_milligram, -> { where("amount > 0").where.not(amount_mg: nil).order("amount_mg DESC") }

  belongs_to :ingredient
  belongs_to :nutrition_fact
  belongs_to :unit
end
