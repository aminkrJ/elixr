class UserController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def dashboard
  end

  def profile
  end
end
