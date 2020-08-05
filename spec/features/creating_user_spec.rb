require 'rails_helper'

RSpec.feature 'User', type: :feature do

  scenario 'Can create a user and view own wall' do
    visit '/'
    click_button 'Sign Up'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'test1234'
    click_button 'Create User'
    expect(page).to have_content('Welcome to your wall, test@test.com')
  end

  scenario 'Returns error if invalid email' do
    visit '/'
    click_button 'Sign Up'
    fill_in 'user_email', with: 'abademail'
    fill_in 'user_password', with: 'test1234'
    click_button 'Create User'
    expect(page).to have_content('Email in fincorrect format')
  end

  scenario 'Returns error if invalid password' do
    visit '/'
    click_button 'Sign Up'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'test'
    click_button 'Create User'
    expect(page).to have_content("Password in fincorrect format - please enter 6-10 characters")
  end

end
