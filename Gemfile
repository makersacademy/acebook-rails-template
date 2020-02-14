ruby '2.6.5'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# boostrap to help....with the CSS
gem 'bootstrap-sass', '~> 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Lets use jQuery!!!!
gem 'jquery-rails'
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# =======================================================

# Keep all of our dirty secrets safe
gem 'bcrypt'

# Use Travis CI for continuous integration
gem 'travis'

# Use figaro for managing environment variables
gem 'figaro'

# Rake for raking
gem 'rake'

# =======================================================

group :test do
  # Cleaning up the mistakes we make in testing
  gem 'database_cleaner-active_record'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.5'

  # For super snappy tests and loads - DO NOT INSTALL ON PRODUCTION
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-rubocop'

  # Gotta cover them all
  gem 'simplecov'
  gem 'simplecov-console'
  gem 'simplecov-small-badge'

  # Rubocop for ensuring the code abides by the LAW
  gem 'rubocop'
  gem 'rubocop-rails'
end

group :production do
  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
end
