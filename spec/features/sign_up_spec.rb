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

      expect(current_path).to eq('/') #to be replaced with the path to the login page 
    end

    scenario 'a user should enter matching passwords' do
      visit "/users/new"
      fill_in "Username", with: "test"
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "password123"
      fill_in "Password confirmation", with: "password12345"
      click_button "Register"

      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    scenario 'a user should enter unique email' do
      User.create(username: "anything3", email: "test@example.com", password: "1234", password_confirmation: "1234")
      visit "/users/new"
      fill_in "Username", with: "test"
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "password123"
      fill_in "Password confirmation", with: "password123"
      click_button "Register"

      expect(page).to have_content("Email has already been taken")
    end
  end
end