class Admin::PostcodesController < AdminController
  def index
    @postcodes = Postcode.order("count DESC").all
  end
end
