require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up for Acebook" do
    user_signup
    expect(page).to have_content("Welcome Arabella Knowles")
  end
  # scenario "Sign up button not visible once signed in" do
    
end