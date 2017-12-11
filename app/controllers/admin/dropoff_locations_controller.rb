class Admin::DropoffLocationsController < ApplicationController
  before_action :set_dropoff_location, only: [:show, :edit, :update, :destroy]

  # GET /dropoff_locations
  # GET /dropoff_locations.json
  def index
    @dropoff_locations = DropoffLocation.all
  end

  # GET /dropoff_locations/1
  # GET /dropoff_locations/1.json
  def show
  end

  # GET /dropoff_locations/new
  def new
    @dropoff_location = DropoffLocation.new
  end

  # GET /dropoff_locations/1/edit
  def edit
  end

  # POST /dropoff_locations
  # POST /dropoff_locations.json
  def create
    @dropoff_location = DropoffLocation.new(dropoff_location_params)

    respond_to do |format|
      if @dropoff_location.save
        format.html { redirect_to [:admin, @dropoff_location], notice: 'Dropoff location was successfully created.' }
        format.json { render :show, status: :created, location: @dropoff_location }
      else
        format.html { render :new }
        format.json { render json: @dropoff_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dropoff_locations/1
  # PATCH/PUT /dropoff_locations/1.json
  def update
    respond_to do |format|
      if @dropoff_location.update(dropoff_location_params)
        format.html { redirect_to [:admin, @dropoff_location], notice: 'Dropoff location was successfully updated.' }
        format.json { render :show, status: :ok, location: @dropoff_location }
      else
        format.html { render :edit }
        format.json { render json: @dropoff_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dropoff_locations/1
  # DELETE /dropoff_locations/1.json
  def destroy
    @dropoff_location.destroy
    respond_to do |format|
      format.html { redirect_to admin_dropoff_locations_url, notice: 'Dropoff location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dropoff_location
      @dropoff_location = DropoffLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dropoff_location_params
      params.require(:dropoff_location).permit(:address, :suburb)
    end
end
