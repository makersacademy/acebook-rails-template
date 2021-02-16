require 'capybara'

def log_in
  visit "/login"
  fill_in "username", with: "testuser1"
  fill_in "password", with: "password"
  click_on "Log In"
end

RSpec.configure do |config|

  config.include Capybara::DSL
  config.before(:each) do
    log_in
  end
  
end