class Admin::ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  # GET /product_category
  # GET /product_category.json
  def index
    @product_categories = ProductCategory.all
  end

  # GET /product_category/1
  # GET /product_category/1.json
  def show
  end

  # GET /product_category/new
  def new
    @product_category = ProductCategory.new
  end

  # GET /product_category/1/edit
  def edit
  end

  # POST /product_category
  # POST /product_category.json
  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to [:admin, @product_category], notice: 'ProductCategory was successfully created.' }
        format.json { render :show, status: :created, location: @product_category }
      else
        format.html { render :new }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_category/1
  # PATCH/PUT /product_category/1.json
  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to [:admin, @product_category], notice: 'ProductCategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_category }
      else
        format.html { render :edit }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_category/1
  # DELETE /product_category/1.json
  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_categories_url, notice: 'ProductCategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_category_params
      params.require(:product_category).permit(:id, :name, :short_description, :description, :active)
    end
end
