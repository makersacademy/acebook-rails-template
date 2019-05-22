require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
    scenario "Can see Sign Up form" do
      visit "/"
      expect(page).to have_content("Sign Up")
    end

    scenario "Can fill out Sign Up form" do
      visit("/")
      fill_in "Email", with: "test@email.com"
      fill_in "Password", with: "testpassword"
      click_button "Submit"
      expect(page).to have_content("Sign Up Successful!")
    end
end