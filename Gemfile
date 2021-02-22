# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.2'

gem 'activerecord'
# Use ActiveModel has_secure_password
gem 'bcrypt'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
gem 'rake'
# Use SCSS for stylesheets
gem 'sass-rails'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sinatra-reloader'
gem 'sinatra-flash'
# gem 'thin'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development do
  # Use Capistrano for deployment
  # gem 'capistrano-rails'
  gem 'listen'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
