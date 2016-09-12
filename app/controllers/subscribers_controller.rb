class SubscribersController < PublicController

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      render json: @subscriber
    else
      render json: @subscriber.errors, status: :unprocessable_entity
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:id, :full_name, :subscribed_to, :email)
  end

  def set_subscriber
    @subscriber = Subscriber.find params[:id]
  end

end
