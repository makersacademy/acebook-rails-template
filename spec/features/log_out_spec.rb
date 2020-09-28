require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "Can  create account and log in when logged out" do
    signup_and_login
    expect(page).to have_content("Logged in as testuser.")
  end
end