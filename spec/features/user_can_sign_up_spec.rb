require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up for Acebook" do
    user_signup('arakno', 'arakno@makers.com')
    expect(page).to have_content("Welcome Arabella Knowles")
  end
  scenario "Sign up button not visible once signed up" do
    user_signup('arakno', 'arakno@makers.com')
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Sign Up")
  end
  scenario "Email must be unique" do
    user_signup('arakno', 'arakno@makers.com')
    click_link 'Logout'
    user_signup('dan', 'arakno@makers.com')
    expect(page).to have_content("Email already in use.")
  end
  scenario "Username must be unique" do
    user_signup('arakno', 'dan@makers.com')
    click_link 'Logout'
    user_signup('arakno', 'arakno@makers.com')
    expect(page).to have_content("Username already in use.")
  end
  scenario "Email must be valid in order to sign up" do
    user_signup('arakno', 'dan-makers.com')
    expect(page).to have_content("dan-makers.com is not a valid email address")
  end 
end