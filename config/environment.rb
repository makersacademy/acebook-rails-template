# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Heroku config:set HEROKU_DEBUG_RAILS_RUNNER=1
