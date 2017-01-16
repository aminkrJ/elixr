class Admin::MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /admin/meals
  # GET /admin/meals.json
  def index
    @meals = Meal.all
  end

  # GET /admin/meals/1
  # GET /admin/meals/1.json
  def show
  end

  # GET /admin/meals/new
  def new
    @meal = Meal.new
  end

  # GET /admin/meals/1/edit
  def edit
  end

  # POST /admin/meals
  # POST /admin/meals.json
  def create
    @meal = Meal.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to [:admin, @meal], notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/meals/1
  # PATCH/PUT /admin/meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to [:admin, @meal], notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/meals/1
  # DELETE /admin/meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to admin_meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:name, :description, :light, :vegan, :raw, :gluten_free, :organic, :photo, :restaurant_id)
    end
end
