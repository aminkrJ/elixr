class Api::V1::DropoffLocationsController < Api::V1::BaseController
  def search
    # collecting postcodes
    Postcode.pickup params[:postcode]

    @dropoff_locations = DropoffLocation.where(suburb: params[:postcode])
    render :index
  end
end
