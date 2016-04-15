class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :set_form_variables, only: [:edit, :new, :duplicate, :update, :fetch]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    @ingredient_nutrition_facts = @ingredient.ingredient_nutrition_facts.where("amount > 0").order("amount DESC")
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  def duplicate
    existing_ingredient = Ingredient.find params[:id]
    @duplicated_from = existing_ingredient.name

    @ingredient = existing_ingredient.amoeba_dup
    @ingredient.name, @ingredient.unit_id, @ingredient.amount, @ingredient.tags = nil, nil, nil, nil
    render :new
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fetch
    scraper = Scraper::Parser.new params[:url]
    scraper.parse
    scraper_nutrition_facts = scraper.nutrition_facts

    @ingredient = Ingredient.new name: params[:name], amount: scraper.per_serving_amount, unit: Unit.find_by_name_or_symbol(scraper.per_serving_unit)

    scraper_nutrition_facts.each do |nf|
      nutrition_fact = NutritionFact.find_by name: nf.name
      @ingredient.ingredient_nutrition_facts << IngredientNutritionFact.new(amount: nf.amount, nutrition_fact: nutrition_fact, unit: Unit.find_by_name_or_symbol(nf.unit))
    end

    render :new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :tags, :unit_id, :amount, ingredient_nutrition_facts_attributes: [:id, :amount, :unit_id, :_destroy, :nutrition_fact_id])
    end

    def set_form_variables
      @nutrition_facts = NutritionFact.all
      @units = Unit.all
    end
end
