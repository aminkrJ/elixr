class Api::V1::SubscribersController < Api::V1::BaseController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    campaign = Campaign.find params[:campaign_id]
    @subscriber = campaign.subscribers.new(subscriber_params)

    if @subscriber.save
      render json: @subscriber
    else
      render json: @subscriber.errors, status: :unprocessable_entity
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:id, :full_name, :email)
  end

  def set_subscriber
    @subscriber = Subscriber.find params[:id]
  end
end
