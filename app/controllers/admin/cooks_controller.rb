class Admin::CooksController < AdminController
  before_action :set_cook, only: [:show, :edit, :update, :destroy]

  def index
    @cooks = Cook.all
  end

  def show
  end

  def new
    @cook = Cook.new
  end

  def edit
  end

  def create
    @cook = Cook.new(cook_params)

    respond_to do |format|
      if @cook.save
        format.html { redirect_to [:admin, @cook], notice: 'Cook was successfully created.' }
        format.json { render :show, status: :created, location: @cook }
      else
        format.html { render :new }
        format.json { render json: @cook.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cook.update(cook_params)
        format.html { redirect_to [:admin, @cook], notice: 'Cook was successfully updated.' }
        format.json { render :show, status: :ok, location: @cook }
      else
        format.html { render :edit }
        format.json { render json: @cook.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cook.destroy
    respond_to do |format|
      format.html { redirect_to admin_cooks_url, notice: 'Cook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cook
      @cook = Cook.find(params[:id])
    end

    def cook_params
      params.require(:cook).permit(:name)
    end
end
