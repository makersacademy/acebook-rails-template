require 'rails_helper'

RSpec.feature "Registration", type: :feature do
  feature 'registration' do
    scenario 'a user can sign up' do
      visit "/users/new"
      fill_in "Username", with: "test"
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "password123"
      fill_in "Password confirmation", with: "password123"
      click_button "Register"

      expect(current_path).to eq('/users/login') #to be replaced with the path to the login page 
      expect(page).to have_content ("Log in") # to be replaced with the new log in page 
    end
  end
end