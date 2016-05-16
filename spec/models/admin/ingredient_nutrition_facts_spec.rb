require 'rails_helper'
require_relative '../../concerns/unit_convertible_spec'

RSpec.describe IngredientNutritionFact, type: :model do
  it_behaves_like "unit_convertible"
end
