source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.12.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# gem 'racc', '~> 1.5', '>= 1.5.2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# bootstrap alternative
gem 'bulma-rails', '~> 0.9.1'

gem 'simple_form', '~> 5.1'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# gem 'travis'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  
  gem 'rspec-rails', '~> 5.0.1'

  gem "rubocop", "0.79.0", require: false
  gem "rubocop-rails"
  gem 'shoulda', '~> 3.5'
<<<<<<< HEAD
  
=======
>>>>>>> feat: shoulda gem
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # For making debugging box
  gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
  gem 'launchy'
  gem 'shutup'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
