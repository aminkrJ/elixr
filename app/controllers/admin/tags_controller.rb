class Admin::TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tag
  # GET /tag.json
  def index
    @tags = Tag.all
  end

  # GET /tag/1
  # GET /tag/1.json
  def show
  end

  # GET /tag/new
  def new
    @tag = Tag.new
  end

  # GET /tag/1/edit
  def edit
  end

  # POST /tag
  # POST /tag.json
  def create
    @tag = Tag.new(product_category_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to [:admin, @tag], notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag/1
  # PATCH/PUT /tag/1.json
  def update
    respond_to do |format|
      if @tag.update(product_category_params)
        format.html { redirect_to [:admin, @tag], notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag/1
  # DELETE /tag/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to admin_tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_category_params
      params.require(:tag).permit(:id, :name, :short_description)
    end
end
