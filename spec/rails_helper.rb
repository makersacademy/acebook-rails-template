# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'devise'

require_relative 'support/controller_macros'
require_relative './helpers/helping_hand'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true #? false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Devise::Test::ControllerHelpers, type: :controller

  config.include FactoryBot::Syntax::Methods

  config.extend ControllerMacros, type: :controller
end
