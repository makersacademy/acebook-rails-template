# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing Up', type: :feature do
  scenario 'successful sign up' do
    sign_up(user_name: 'user1', user_email: 'user1@test.com',
            user_password: 'password1')

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'password must be longer than 6 characters' do
    sign_up(user_name: 'user1', user_email: 'user1@test.com',
            user_password: '1')

    expect(page).to have_content 'Password is too short (minimum is 6 characters)'
  end

  scenario 'password must shorter than 10 characters' do
    sign_up(user_name: 'user1', user_email: 'user1@test.com',
            user_password: 'password1111')

    expect(page).to have_content 'Password is too long (maximum is 10 characters)'
  end

  scenario 'user must enter a valid email' do
    sign_up(user_name: 'user1', user_email: 'user1test.com',
            user_password: 'password1')

    expect(page).to have_content 'Email is invalid'
  end
end
