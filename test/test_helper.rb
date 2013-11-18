require "simplecov"
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/focus"

require "capybara/webkit"
Capybara.javascript_driver = :webkit
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all
  include Capybara::DSL
  # Add more helper methods to be used by all tests here...
end
# class ActionDispatch::IntegrationTest
#   include Rails.application.routes.url_helpers
#   include Capybara::DSL
# end

# signs in a user

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: "password"
  click_button "Sign in"
end
