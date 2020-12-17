require 'rails_helper'
require 'helpers/user_helper'

RSpec.feature "User Log Out", type: :feature do
    scenario "User can log out from BragBook" do
      sign_up
      click_link "Sign Out"
      expect(page).to have_content("Signed out successfully.")
    end
  end