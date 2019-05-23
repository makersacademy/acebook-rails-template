ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

if ENV["BUNDLE_GEMFILE"]
    require 'simplecov'
    SimpleCov.start 'rails'
  end
