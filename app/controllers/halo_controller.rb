class HaloController < ActionController::Base
  before_action :authenticate_user!

  def dashboard
  end
end
