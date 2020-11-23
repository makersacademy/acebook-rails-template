# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Log In', type: :feature do
  it 'User can log into acebook' do
    visit '/login'
    expect(page).to have_content('Log in')
  end

<<<<<<< HEAD
  xit 'user can login with their name and password' do
=======
  scenario 'user can login with their name and password' do
>>>>>>> master
    User.create(name: 'Emanuele', password: '12345', email: 'ema@test.com')
    visit '/login'
    fill_in 'user[email]', with: 'ema@test.com'
    fill_in 'user[password]', with: '12345'
    click_on 'Log in'
    expect(page).to have_content('Welcome to JJERbook')
  end

<<<<<<< HEAD
  xit 'error raised for invalid credentials' do
=======
  scenario 'error raised for invalid credentials' do
>>>>>>> master
    User.create(name: 'Emanuele', password: '12345', email: 'ema@test.com')
    visit '/login'
    fill_in 'user[email]', with: 'ema@test.com'
    fill_in 'user[password]', with: 'incorrect'
    click_on 'Log in'
    expect(page).to have_content('Incorrect E-mail/Password Combination')
  end
end
