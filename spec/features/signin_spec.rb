require 'rails_helper'
RSpec.feature 'Signin', type: :feature do
  scenario "A user signs in and see's their account details" do

    visit '/signup'
    fill_in 'users_username', with: '1'
    fill_in 'users_email', with: 'Test100@test.com'
    fill_in 'users_password', with: '12345'
    find('input[name="commit"]').click
    click_on "Log Out"
    click_link "Log In!"
    fill_in 'session_email', with: 'Test100@test.com'
    fill_in 'session_password', with: '12345'
    find('input[name="commit"]').click
    expect(page).to have_content('1')

  end

  scenario "Signin is case sensitive" do
    visit '/signup'
    fill_in 'users_username', with: '1'
    fill_in 'users_email', with: 'Test100@test.com'
    fill_in 'users_password', with: '12345'
    find('input[name="commit"]').click
    click_on "Log Out"
    click_link "Log In!"
    fill_in 'session_email', with: 'test100@test.com'
    fill_in 'session_password', with: '12345'
    find('input[name="commit"]').click
    expect(page).to have_content('you cretin')

  end
end
