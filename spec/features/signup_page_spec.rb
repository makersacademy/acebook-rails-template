# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Sign up', type: :feature do
  scenario 'User is at sign up page' do
    sign_up
    expect(page).to have_content 'May the force be with you. Welcome to Acebook!'
    expect(page).to have_content 'Logged in as james@test.com.'
  end

  scenario 'User can only enter a password of 6 or more characters' do
    visit 'users/sign_up'
    fill_in 'user_email', with: 'james@test.com'
    fill_in 'user_password', with: '1234'
    fill_in 'user_password_confirmation', with: '1234'
    click_button 'Sign up'
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end

  scenario 'User can only enter a password of 10 or less characters' do
    visit 'users/sign_up'
    fill_in 'user_email', with: 'james@test.com'
    fill_in 'user_password', with: '12345678910'
    fill_in 'user_password_confirmation', with: '12345678910'
    click_button 'Sign up'
    expect(page).to have_content('Password is too long (maximum is 10 characters)')
  end
end
