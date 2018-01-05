class Admin::PostcodesController < AdminController
  before_action :set_postcode, only: [:show, :edit, :update, :destroy]

  def index
    @postcodes = Postcode.order("count DESC").all
  end

  def destroy
    @postcode.destroy
    respond_to do |format|
      format.html { redirect_to admin_postcodes_url, notice: 'Postcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postcode
      @postcode = Postcode.find(params[:id])
    end


end
