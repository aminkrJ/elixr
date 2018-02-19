class PublicController < ApplicationController
  protect_from_forgery with: :exception

  def experience
    @subscriber = Subscriber.new
  end

  def notify_me
    @campaign = Campaign.find_by_strategy "NotifyMe"
    @subscriber = @campaign.subscribers.new params.permit(:full_name, :email)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to :root, notice: 'You will be notified when the App is ready.' }
      else
        format.html { render :experience }
      end
    end
  end
end
