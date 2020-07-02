require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'User can sign up to acebook' do
    visit '/signup'
    expect(page).to have_content('Sign Up')
  end

  scenario 'User can sign up with a name' do
    visit '/signup'
    fill_in 'user[name]', with: 'Emanuele'
    fill_in 'user[email]', with: 'ema@test.com'
    fill_in 'user[password_digest]', with: '12345'
    click_on 'Sign up'
    expect(page).to have_content('Welcome to JJERbook')
    end
  end
