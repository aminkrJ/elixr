Rollbar.configure do |config|
  config.access_token = Rails.application.secrets.rollbar_access_token
end
