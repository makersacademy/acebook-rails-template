# rubocop:disable LineLength

# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# For Rails controller rspec testing
gem 'rails-controller-testing'
# For protecting sensitive data and use of ENV variables and application.yml
# to use after bundle install run (in CL): bundle exec figaro install
gem 'figaro'
# AWS S3 storage for user avatars
gem 'aws-sdk', '~> 3'
# jQuery gem for rails
gem 'jquery-rails'
# Paperclip used with imagemagick package to add avatar pics for users
gem 'paperclip'
# User Authentification System with ORM that creates signup login and user db table
gem 'devise'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use postgresql as the database for Active Record
gem 'pg', '0.18.1', group: :production
gem 'rails_12factor', group: :production
gem 'sqlite3', group: :development
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'acts_as_votable', '~> 0.11.1'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop-rails'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false, group: :test
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# rubocop:enable LineLength
