# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Log In', type: :feature do
  scenario 'After sign up, a user can log in and be directed to posts page' do
    visit '/users/new'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: '123'
    click_button 'Create my account'
    visit '/login'
    fill_in 'session_email', with: 'test@gmail.com'
    fill_in 'session_password', with: '123'
    click_button 'Log in'
    expect(page).to have_link('New post')
  end

  scenario 'Incorrect details or unregistered user cannot sign in' do
    visit '/login'
    fill_in 'session_email', with: 'test@gmail.com'
    fill_in 'session_password', with: '123'
    click_button 'Log in'
    expect(page).to have_content('Invalid email/password combination!')
  end
end
