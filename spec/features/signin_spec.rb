require 'rails_helper'
RSpec.feature 'Signin', type: :feature do
  scenario "A user signs in and see's their account details" do
    signup_and_click
    visit '/signup'
    fill_in 'users_username', with: 'Test 002'
    fill_in 'users_email', with: 'Test200@test.com'
    fill_in 'users_password', with: 'Password2'
    find('input[name="commit"]').click
    visit '/signup'
    fill_in 'users_username', with: 'Test 003'
    fill_in 'users_email', with: 'Test300@test.com'
    fill_in 'users_password', with: 'Password3'
    find('input[name="commit"]').click
    visit '/signin'
    fill_in 'users_email', with: 'Test200@test.com'
    fill_in 'users_password', with: 'Password002'
    find('input[name="commit"]').click
    expect(page).to have_content('Test 002')
  end
end
