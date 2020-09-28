require 'rails_helper'

RSpec.feature "View Profile", type: :feature do
  scenario "Can view profile when logged in" do
    signup_and_login
    expect(page).to have_content("Logged in as testuser.")
    click_link "My Profile"
    expect(page).to have_content("Email: test@test.com")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Destroy")
    expect(page).to have_content("Back")
  end
end