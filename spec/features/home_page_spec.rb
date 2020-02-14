require 'rails_helper'

RSpec.feature "HomePage", type: :feature do 
  scenario "Can See a sign in and fields for it and sign up link" do 
    visit "/"
    expect(page).to have_button("Sign Up")
    # expect(page).to have_content("Sign In")
    # expect(page).to have_field("username")
    # expect(page).to have_field("password")
    # expect(page).to have_selector(:link_or_button, "Sign In")
  end
end 