require 'rails_helper'

RSpec.feature "View Profile", type: :feature do
  scenario "Can view profile when logged in" do
    signup_and_login
    expect(page).to have_content("testuser's profile")
    click_link "My Profile"
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete Profile")
  end
  
  scenario "Cant view profile when logged out" do
    signup_and_login
    expect(page).to have_content("testuser's profile")
    click_link "Log Out"
    expect(page).not_to have_content("testuser's profile")
  end
end