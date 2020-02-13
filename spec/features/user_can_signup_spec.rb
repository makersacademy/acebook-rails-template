require 'rails_helper'

RSpec.feature 'Users can signup to site', type: :feature do
  scenario 'Can visit Signup Page' do
    visit('/')
    click_on('Signup')
    expect(page).to have_content('Please Signup')
  end
  scenario 'User cannot sign up with email which is already taken' do
    visit('/')
    click_on('Signup')
    fill_in('users[email]', with: 'test@test.com')
    fill_in('users[password]', with: 'password')
    click_on('Signup')
    visit('/')
    click_on('Signup')
    fill_in('users[email]', with: 'test@test.com')
    fill_in('users[password]', with: 'password')
    click_on('Signup')
    expect(page).to have_content('Email already taken, please chose another')
  end
  scenario 'User cannot sign up with invalid email' do
    visit('/')
    click_on('Signup')
    fill_in('users[email]', with: 'test@testcom')
    fill_in('users[password]', with: 'password')
    click_on('Signup')
    expect(page).to have_content('Email format invaild, please enter valid email')
  end

end
