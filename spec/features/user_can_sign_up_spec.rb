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
    #sign_out
    user_signup('dan', 'arakno@makers.com')
    expect(page).to have_content("Email already in use.")
  end
  # pending "Username must be unique" do
  #   user_signup('arakno', 'dan@makers.com')
  #   expect(page).to have_content("Username already in use.")
  # end
end