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
    fill_in 'user[username]', with: 'HomerSimpson'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully')
  end

  scenario 'Will not create an account if password is too short' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[username]', with: 'HomerSimpson'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'abc12'
    fill_in 'user[password_confirmation]', with: 'abc12'
    click_button 'Sign up'

    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end

  scenario 'Will not create an account if password is too long' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[username]', with: 'HomerSimpson'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'abcdef123456'
    fill_in 'user[password_confirmation]', with: 'abcdef123456'
    click_button 'Sign up'

    expect(page).to have_content('Password is too long (maximum is 10 characters)')
  end

  scenario 'Will not create an account if email is already registered' do
    visit '/'
    create_user
    click_link 'Sign Up'
    fill_in 'user[username]', with: 'NotHomerSimpson'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Email has already been taken')
  end

  scenario 'Will not create an account if username has been taken' do
    create_user
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[username]', with: 'HomerSimpson'
    fill_in 'user[email]', with: 'test2@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Username has already been taken')
  end

  scenario 'Will not create an account if username is left blank' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[email]', with: 'test2@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Username can't be blank")
  end

  scenario 'Will not create an account if passwords do not match' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[username]', with: 'HomerSimpson'
    fill_in 'user[email]', with: 'test2@test.com'
    fill_in 'user[password]', with: 'abc123'
    fill_in 'user[password_confirmation]', with: '123abc'
    click_button 'Sign up'
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
