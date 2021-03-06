require_relative 'support/controller_helpers'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'devise'
require "paperclip/matchers"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.include Paperclip::Shoulda::Matchers
  config.include ControllerHelpers, type: :controller
  Warden.test_mode!

  config.after do
    Warden.test_reset!
    Capybara.reset_session!
    Capybara.use_default_driver
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/test_files/"])
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
