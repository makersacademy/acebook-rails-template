require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'Can sign up with name email and pw' do
    visit '/users/sign_up'
    # click_link 'New post'
    fill_in 'user_user_name', with: 'tester'
    fill_in 'user_email', with: 'tester@tester.com'
    fill_in 'user_password', with: '1234567'
    fill_in 'user_password_confirmation', with: '1234567'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    # expect(page).to have_content('Signed in successfully.')
  end
end
