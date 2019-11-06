# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign_up', type: :feature do
  scenario 'can access sign up page' do
    visit '/'
    click_link 'Sign Up'
    expect(page).to have_content('Sign up')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password (6 characters minimum)')
  end

  scenario 'Can create a new user account' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[user_name]', with: 'HomerSimpson'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully')
  end
end
