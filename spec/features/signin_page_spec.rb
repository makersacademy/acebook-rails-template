require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Sign in', type: :feature do
  scenario 'User is at sign in page' do
    sign_up
    click_link('Logout')
    visit '/users/sign_in'
    fill_in 'user_email', with: 'james@test.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Logged in as james@test.com.'
  end
end
