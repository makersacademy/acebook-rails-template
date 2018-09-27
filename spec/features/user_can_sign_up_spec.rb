require 'rails_helper'

feature 'User can sign up' do
  before(:each) do
    visit 'users/sign_up'
  end

  scenario 'blank email gives an error' do
    fill_in 'user[password]', with: 'tester'
    click_on 'Sign up'
    expect(page).to have_content('Email can\'t be blank')
  end

  scenario 'blank password gives an error' do
    fill_in 'user[email]', with: 'test@test.com'
    click_on 'Sign up'
    expect(page).to have_content('Password can\'t be blank')
  end

  scenario 'confirms successful sign up' do
    save_and_open_page
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'tester'
    fill_in 'user[password_confirmation]', with: 'tester'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
