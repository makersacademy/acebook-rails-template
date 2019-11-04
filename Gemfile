# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'clearance'
gem 'jbuilder', '~> 2.5'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.1'
gem 'rails-controller-testing'
gem 'rubocop', require: false
gem 'sass-rails', '~> 5.0'
gem 'simplecov', require: false, group: :test
gem 'travis'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'rspec-rails', '~> 3.5'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

gem 'factory_bot_rails'
gem 'materialize', '0.4.5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
