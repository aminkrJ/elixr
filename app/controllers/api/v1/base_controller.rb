class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    return api_error(status: 404, errors: 'Not found')
  end
end
