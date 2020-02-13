require 'rails_helper'

RSpec.feature 'Users can signup to site', type: :feature do
  scenario 'Can visit Signup Page' do
    visit('/')
    click_on('Signup')
    expect(page).to have_content('Please Signup')
  end

  scenario 'User cannot sign up with email which is already taken' do
    User.create!(email: 'test@test.com', password: 'password').save
    visit('/')
    click_on('Signup')
    fill_in('users[email]', with: 'test@test.com')
    fill_in('users[password]', with: 'password')
    click_on('Signup')
    expect(page).to have_content('Email already taken, please choose another')
  end

  scenario 'User cannot sign up with invalid email' do
    visit('/')
    click_on('Signup')
    fill_in('users[email]', with: 'test@testcom')
    fill_in('users[password]', with: 'password')
    click_on('Signup')
    expect(page).to have_content('Email format invaild, please enter valid email')
  end

  scenario 'User cannot sign up password less than 6 charaters' do
    visit('/')
    click_on('Signup')
    fill_in('users[email]', with: 'test@testcom')
    fill_in('users[password]', with: 'passw')
    click_on('Signup')
    expect(page).to have_content('Password length incorrect, please enter a password between 6 and 10 charaters')
  end

  scenario 'User cannot sign up password more than 10 charaters' do
    visit('/')
    click_on('Signup')
    fill_in('users[email]', with: 'test@testcom')
    fill_in('users[password]', with: 'password10c')
    click_on('Signup')
    expect(page).to have_content('Password length incorrect, please enter a password between 6 and 10 charaters')
  end
end
