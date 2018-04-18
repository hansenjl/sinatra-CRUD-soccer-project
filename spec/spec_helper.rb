ENV["SINATRA_ENV"] = "test"

# Load RSpec and Capybara
require_relative '../config/environment'
require 'rack/test'
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'

# hides DB transactions
ActiveRecord::Base.logger = nil

# Configure RSpec
RSpec.configure do |config|
  # Mixin the Capybara functionality into Rspec
  config.include Rack::Test::Methods  # allows get and post requests
  config.include Capybara::DSL

  # Clean the database before each test
  DatabaseCleaner.strategy = :truncation

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.order = 'default'
end


# Define the application we're testing
def app
  # Load the application defined in config.ru
  Rack::Builder.parse_file('config.ru').first
end

# Configure Capybara to test against the application above.
Capybara.app = app