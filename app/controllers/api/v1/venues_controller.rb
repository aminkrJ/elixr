class Api::V1::VenuesController < Api::V1::BaseController
  def search
    # collecting postcodes
    Postcode.pickup params[:postcode]

    @venues = Venue.where(suburb: params[:postcode], status: "ACTIVE")
    render :index
  end
end
