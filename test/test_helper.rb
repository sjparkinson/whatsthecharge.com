ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require_relative './authentication_helper'
require 'rails/test_help'

class ActiveSupport::TestCase
  include AuthenticationHelper

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include AuthenticationHelper
end

# Enable the use of default_password in test fixtures
ActiveRecord::FixtureSet.context_class.send :include, AuthenticationHelper
