require 'rails_helper'

RSpec.feature "User Log Out", type: :feature do

  scenario "After log in, a user can log out and be directed to index page" do
    visit "/users/new"
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: '123'
    click_button "Create my account"
    visit "/login"
    fill_in 'session_email', with: 'test@gmail.com'
    fill_in 'session_password', with: '123'
    click_button 'Log in'
    click_link 'Log out'
    expect(page).to have_link("Log in")
  end
end