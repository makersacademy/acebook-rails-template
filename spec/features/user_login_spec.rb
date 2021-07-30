require 'rails_helper'
require_relative 'web_helpers/users_helper'

RSpec.feature "Login", type: :feature do
  scenario "User can login" do
    signup_login
    expect(page).to have_content("Homepage")
  end
end
