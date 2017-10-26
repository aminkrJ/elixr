class Admin::SubscribersController < AdminController
  before_action :set_campaign
  before_action :set_subscriber, only: [:edit, :show]

  def index
    @subscribers = @campaign.subscribers
  end

  def new
    @subscriber = @campaign.subscribers.new
  end

  def show
  end

  def edit
  end

  def update
    @subscriber = @campaign.subscribers.find(params[:id]).update(subscriber_params)
    respond_to do |format|
      if @subscriber
        format.html { redirect_to [:admin, @campaign, @subscriber], notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber }
      else
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @subscriber = @campaign.subscribers.new(subscriber_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to [:admin, @campaign, @subscriber], notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { render :new }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @campaign.subscribers.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_campaign_subscribers_url(@campaign), notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = Campaign.find params[:campaign_id]
  end

  def set_subscriber
    @subscriber = @campaign.subscribers.find params[:id]
  end

  def subscriber_params
    params.require(:subscriber).permit(:id, :email, :full_name, :subscribed_to)
  end
end
