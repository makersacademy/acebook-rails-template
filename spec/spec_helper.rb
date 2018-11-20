require 'capybara'
require 'devise'
require 'selenium-webdriver'
require 'factory_bot'
require 'factory_bot_rails'
require 'simplecov'
require 'simplecov-console'
require 'warden'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                SimpleCov::Formatter::Console
                                                                ])
  SimpleCov.start

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include FactoryBot::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.after :each do
    Warden.test_reset!
  end
end
