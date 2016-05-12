class Admin::IngredientCategoriesController < ApplicationController
  before_action :set_admin_ingredient_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/ingredient_categories
  # GET /admin/ingredient_categories.json
  def index
    @admin_ingredient_categories = Admin::IngredientCategory.all
  end

  # GET /admin/ingredient_categories/1
  # GET /admin/ingredient_categories/1.json
  def show
  end

  # GET /admin/ingredient_categories/new
  def new
    @admin_ingredient_category = Admin::IngredientCategory.new
  end

  # GET /admin/ingredient_categories/1/edit
  def edit
  end

  # POST /admin/ingredient_categories
  # POST /admin/ingredient_categories.json
  def create
    @admin_ingredient_category = Admin::IngredientCategory.new(admin_ingredient_category_params)

    respond_to do |format|
      if @admin_ingredient_category.save
        format.html { redirect_to @admin_ingredient_category, notice: 'Ingredient category was successfully created.' }
        format.json { render :show, status: :created, location: @admin_ingredient_category }
      else
        format.html { render :new }
        format.json { render json: @admin_ingredient_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/ingredient_categories/1
  # PATCH/PUT /admin/ingredient_categories/1.json
  def update
    respond_to do |format|
      if @admin_ingredient_category.update(admin_ingredient_category_params)
        format.html { redirect_to @admin_ingredient_category, notice: 'Ingredient category was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_ingredient_category }
      else
        format.html { render :edit }
        format.json { render json: @admin_ingredient_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/ingredient_categories/1
  # DELETE /admin/ingredient_categories/1.json
  def destroy
    @admin_ingredient_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_ingredient_categories_url, notice: 'Ingredient category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_ingredient_category
      @admin_ingredient_category = Admin::IngredientCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_ingredient_category_params
      params.require(:admin_ingredient_category).permit(:title, :color, :description)
    end
end
