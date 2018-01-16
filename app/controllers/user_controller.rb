class UserController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def dashboard
    @orders = current_user.venues.last.carts.order("delivery_at DESC, created_at DESC")
  end

  def profile
  end
end
