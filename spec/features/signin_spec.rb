require 'rails_helper'
RSpec.feature 'Signin', type: :feature do
  scenario "A user signs in and see's their account details" do
    signup_and_click

    visit '/login'
    fill_in 'session_email', with: 'Test100@test.com'
    fill_in 'session_password', with: 'Password001'
    find('input[name="commit"]').click
    expect(page).to have_content('Test 001')
  end
end
