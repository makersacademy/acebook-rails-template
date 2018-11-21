# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing Up', type: :feature do
  scenario 'successful sign up' do
    signup1
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'password must be longer than 6 characters' do
    visit('/')
    click_link('Register')
    fill_in(:user_name, with: 'user1')
    fill_in(:user_email, with: 'user1@test.com')
    fill_in(:user_password, with: '1')
    fill_in(:user_password_confirmation, with: '1')
    click_button 'Sign up'
    expect(page).to have_content 'Password is too short (minimum is 6 characters)'
  end

  scenario 'password must shorter than 10 characters' do
    visit('/')
    click_link('Register')
    fill_in(:user_name, with: 'user1')
    fill_in(:user_email, with: 'user1@test.com')
    fill_in(:user_password, with: '11111111111')
    fill_in(:user_password_confirmation, with: '11111111111')
    click_button 'Sign up'
    expect(page).to have_content 'Password is too long (maximum is 10 characters)'
  end

  scenario 'user must enter a valid email' do
    visit('/')
    click_link('Register')
    fill_in(:user_name, with: 'user1')
    fill_in(:user_email, with: 'user1test.com')
    fill_in(:user_password, with: 'password1')
    fill_in(:user_password_confirmation, with: 'password1')
    click_button 'Sign up'
    expect(page).to have_content 'Email is invalid'
  end
end
