require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  scenario "Can log out when logged in" do
    signup_and_login
    expect(page).to have_content("Logged in as testuser.")
    click_link "Log Out"
    expect(page).not_to have_content("Hello, world!")
  end
end