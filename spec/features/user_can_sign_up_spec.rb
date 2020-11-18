require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up for Acebook" do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    expect(page).to have_content("Welcome Arabella Knowles")
  end
  scenario "Sign up button not visible once signed up" do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4life')
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Sign Up")
  end
  scenario "Email must be unique" do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    click_link 'Logout'
    user_signup('dan', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    expect(page).to have_content("Email already in use.")
  end
  scenario "Username must be unique" do
    user_signup('arakno', 'dan@makers.com', 'Arabella Knowles', 'makers4L')
    click_link 'Logout'
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    expect(page).to have_content("Username already in use.")
  end
  scenario "Email must be valid in order to sign up" do
    user_signup('arakno', 'dan-makers.com', 'Arabella Knowles', 'makers4L')
    expect(page).to have_content("dan-makers.com is not a valid email address")
  end 
  scenario "Password must be between 6-10 characters or is rejected" do
    user_signup('arakno', 'dan@makers.com', 'Arabella Knowles', 'makers4life101')
    expect(page).to have_content("Password must be between 6-10 characters")
  end
end