require 'rails_helper'

RSpec.feature 'Users can signup to site', type: :feature do
  scenario 'Can visit Signup Page' do
    visit('/')
    click_on('Signup')
    expect(page).to have_content('Please Signup')
  end
  scenario 'Can visit Signup Page' do
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
end
