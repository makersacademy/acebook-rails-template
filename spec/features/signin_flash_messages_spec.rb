require 'rails_helper'

RSpec.feature 'Flash message', type: :feature do
  scenario 'Displays a welcome message when user logs in' do
      sign_up_user
      click_button "Sign In"
      fill_in "email", with: "lisa@email.com"
      fill_in "password", with: "Password"
      click_button "Sign In"
      expect(page).to have_content('Welcome, Lisa')
  end

  scenario 'Displays a error message when user enters incorrect details' do
      sign_up_user
      click_button "Sign In"
      fill_in "email", with: "lisa@email.com"
      fill_in "password", with: "wrong"
      click_button "Sign In"
      expect(page).to have_content('Invalid credentials')
  end
end
