class Api::V1::MealsController < Api::V1::BaseController
  def index
    @meals = Meal.includes(:restaurant).all
  end
end
