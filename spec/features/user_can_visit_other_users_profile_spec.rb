require 'rails_helper'

RSpec.feature "User profile url", type: :feature do
  scenario "User can go to another user's profile page using the url /users/:username" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    click_link("LogOut")
    signup_as_new_user("Heli")
    login_as_user("Heli")
    visit("/users/pam-lizard")
    
    expect(page).to have_content("Pam-Lizard")
    expect(page).to have_content("Profile Information")
  end
end