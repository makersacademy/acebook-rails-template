require 'rails_helper'

RSpec.feature "Login", type: :feature do
  feature 'Login' do
    scenario 'a registered user can login' do
      User.create(username: "login", email: "login@example.com", password: "1234", password_confirmation: "1234")
      visit "/login"
      fill_in "session[email]", with: "login@example.com"
      fill_in "session[password]", with: "1234"
      click_button "Log in"

      expect(current_path).to eq('/posts') 
    end

    scenario 'an unregistered user cannot login' do
      visit "/login"
      fill_in "session[email]", with: "fail@example.com"
      fill_in "session[password]", with: "FAIL"
      click_button "Log in"

      expect(current_path).to eq('/login') 
      expect(current_path).not_to eq('/posts') 
      expect(page).to have_content ("Invalid email/password combination.")
    end
  end
end