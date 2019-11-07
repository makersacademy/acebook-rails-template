# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  scenario 'can access login page' do
    visit '/'
    click_link 'Login'
    expect(page).to have_content('Log in')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end

  scenario 'user can login' do
    visit '/'
    create_user
    login_user
    expect(page).to have_content('Welcome back HomerSimpson')
  end

  scenario 'user must enter correct password' do
    visit '/'
    create_user
    visit '/'
    click_link 'Login'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'notpassword'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'user must enter a registered email' do
    visit '/'
    create_user
    visit '/'
    click_link 'Login'
    fill_in 'user[email]', with: 'nottest@test.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'user can reset password' do
    visit '/'
    create_user
    visit '/'
    click_link 'Login'
    click_link 'Forgot your password?'
    expect(current_path).to eq('/users/password/new')
    expect(page).to have_content('Forgot your password?')
  end

  scenario 'user taken to posts page after login' do
    visit '/'
    create_user
    login_user
    expect(current_path).to eq('/posts')
  end
end
