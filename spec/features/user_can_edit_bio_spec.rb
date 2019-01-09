require 'rails_helper'

RSpec.feature "bio", type: :feature do
  scenario "write bio" do
      visit "/"
      click_link "Sign up"
      fill_in "Firstname", with: "Ben"
      fill_in "Lastname", with: "Smith"
      fill_in "Username", with: "BenSmith12"
      fill_in "Email", with: "bensmith@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
      click_link "My Page"
      fill_in "Age", with: "50"
      fill_in "Bio", with: "I like long walks and wine"
      fill_in "Location", with: "Swansea"
      click_button "Update"
      expect(page).to have_content("50")
      expect(page).to have_content("I like long walks and wine")
      expect(page).to have_content("Swansea")

  end
end
