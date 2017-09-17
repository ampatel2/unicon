# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'factory_girl_rails'
require 'rspec/rails'
require 'capybara/rspec'
 
ActiveRecord::Migration.maintain_test_schema!
 
RSpec.configure do |config|
 
  config.use_transactional_fixtures = false
 
  config.before(:suite) do
    if config.use_transactional_fixtures?
      raise(<<-MSG)
        Delete line `config.use_transactional_fixtures = true` from rails_helper.rb
        (or set it to false) to prevent uncommitted transactions being used in
        JavaScript-dependent specs.
 
        During testing, the app-under-test that the browser driver connects to
        uses a different database connection to the database connection used by
        the spec. The app's database connection would not be able to access
        uncommitted transaction data setup over the spec's database connection.
      MSG
    end
    DatabaseCleaner.clean_with(:truncation)
  end  
 
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
 
  config.before(:each, type: :feature) do
    # :rack_test driver's Rack app under test shares database connection
    # with the specs, so continue to use transaction strategy for speed.
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test
 
    if !driver_shares_db_connection_with_specs
      # Driver is probably for an external browser with an app
      # under test that does *not* share a database connection with the
      # specs, so use truncation strategy.
      DatabaseCleaner.strategy = :truncation
    end
  end
 
  config.before(:each) do
    DatabaseCleaner.start
  end
 
  config.append_after(:each) do
    DatabaseCleaner.clean
  end
 
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      # Choose a test framework:
      with.test_framework :rspec
       # Choose one or more libraries:
      with.library :active_record
      with.library :active_model
      with.library :action_controller
      # Or, choose the following (which implies all of the above):
      with.library :rails
    end
  end
 
  config.include Rails.application.routes.url_helpers
  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers
 
  #-------- Methods used in Tests
  def sign_in(role)
    @user = create(:user)
    @user.role = role
    login_as @user
  end
  
  config.infer_spec_type_from_file_location!
end
