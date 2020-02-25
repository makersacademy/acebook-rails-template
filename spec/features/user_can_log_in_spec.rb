require 'rails_helper'

RSpec.feature 'user login', type: :feature do
  scenario 'user can access login page' do
    visit "/"
    click_link "Log In"
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Log in")
  end

  scenario 'user can login' do
    create_user
    visit "/"
    click_link "Log In"
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully")
  end
end
