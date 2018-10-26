require 'rails_helper'

feature 'Sign-up' do
  scenario 'users can sign up successfully' do
    visit new_user_registration_path
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end

feature 'Log-out' do
  scenario 'users can log out' do
    visit new_user_registration_path
    fill_in 'Email', with: 'test2@test.com'
    fill_in 'Password', with: '234567'
    fill_in 'Password confirmation', with: '234567'
    click_button 'Sign up'
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
end

feature 'Log-in' do
  scenario "users can't log in if not signed up" do
    visit new_user_session_path
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'users can log in after sign up' do
    visit new_user_registration_path
    fill_in 'Email', with: 'test2@test.com'
    fill_in 'Password', with: '234567'
    fill_in 'Password confirmation', with: '234567'
    click_button 'Sign up'
    click_link 'Logout'
    visit new_user_session_path
    fill_in 'Email', with: 'test2@test.com'
    fill_in 'Password', with: '234567'
    click_button 'Log in'
    expect(page).to have_content('Logged in as test2@test.com.')
  end
end
