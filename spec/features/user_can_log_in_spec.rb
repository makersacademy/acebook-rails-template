
require 'rails_helper'

RSpec.feature 'Log In', type: :feature do
  scenario 'User can log into acebook' do
    visit '/login'
    expect(page).to have_content('Log in')
  end

  scenario 'user can login with their name and password' do
    User.create(name: "Emanuele", password: '12345', email: 'ema@test.com')
    visit '/login'
    fill_in 'user[email]', with: 'ema@test.com'
    fill_in 'user[password]', with: '12345'
    click_on 'Log in'
    expect(page).to have_content('Welcome to JJERbook')
  end

  scenario 'error raised for invalid credentials' do
    User.create(name: "Emanuele", password: '12345', email: 'ema@test.com')
    visit '/login'
    fill_in 'user[email]', with: 'ema@test.com'
    fill_in 'user[password]', with: 'incorrect'
    click_on 'Log in'
    expect(page).to have_content('Incorrect E-mail/Password Combination')
  end
end
