require 'rails_helper'
RSpec.feature 'Signin', type: :feature do
  xscenario "A user signs in and see's their account details" do

    visit '/signup'
    fill_in 'users_username', with: 'Test 001'
    fill_in 'users_email', with: 'Test100@test.com'
    fill_in 'users_password', with: 'Password001'
    find('input[name="commit"]').click

    visit '/login'

    fill_in 'session_email', with: 'Test100@test.com'
    fill_in 'session_password', with: 'Password001'
    find('input[name="commit"]').click
    expect(page).to have_content('Test 001')
  end
end
