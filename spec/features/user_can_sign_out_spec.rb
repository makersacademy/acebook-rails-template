require 'rails_helper'
require 'helpers/user_helper'

RSpec.feature "User Sign Out", type: :feature do
    scenario "User can sign out from BragBook" do
      sign_up
      click_link "Sign Out"
      expect(page).to have_content("Signed out successfully.")
    end
  end

  RSpec.feature "User Sign Out", type: :feature do
    scenario "User cannot see log out button if not signed in" do
      visit "/"
      expect(page).not_to have_selector(:link_or_button, 'Sign Out')
    end
  end