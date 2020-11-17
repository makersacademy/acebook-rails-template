require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up for Acebook" do
    user_signup
    expect(page).to have_content("Welcome Arabella Knowles")
  end
  scenario "Sign up button not visible once signed up" do
    user_signup
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Sign Up")
  end
    
end