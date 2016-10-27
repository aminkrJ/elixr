class Admin::SubscribersController < AdminController
  before_action :set_subscriber, only: [:destroy]

  def index
    @subscribers = Subscriber.all
  end

  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to admin_subscribers_url, notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end
end
