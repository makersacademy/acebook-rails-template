require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "Can  create account and log in when logged out" do
    signup_and_login
    expect(page).to have_content("Logged in as testuser.")
  end
end

RSpec.feature "Logout", type: :feature do
  scenario "Cannot logout when logged out" do
    signup_and_login
    expect(page).to have_content("Logged in as testuser.")
    expect(page).to have_content("Log Out")
    click_link "Log Out"
    expect(page).not_to have_content("Log Out")
  end
end