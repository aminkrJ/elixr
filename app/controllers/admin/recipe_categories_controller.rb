class Admin::RecipeCategoriesController < AdminController
  before_action :set_recipe_category, only: [:show, :edit, :update, :destroy]

  def index
    @recipe_categories = RecipeCategory.all
  end

  def show
  end

  def new
    @recipe_category = RecipeCategory.new
  end

  def edit
  end

  def create
    @recipe_category = RecipeCategory.new(recipe_category_params)

    respond_to do |format|
      if @recipe_category.save
        format.html { redirect_to [:admin, @recipe_category], notice: 'Recipe category was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_category }
      else
        format.html { render :new }
        format.json { render json: @recipe_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe_category.update(recipe_category_params)
        format.html { redirect_to [:admin, @recipe_category], notice: 'Recipe category was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_category }
      else
        format.html { render :edit }
        format.json { render json: @recipe_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_recipe_categories_url, notice: 'Recipe category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_category
      @recipe_category = RecipeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_category_params
      params.require(:recipe_category).permit(:name, :description, :short_description)
    end
end
