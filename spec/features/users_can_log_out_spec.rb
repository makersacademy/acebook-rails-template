require 'rails_helper'

RSpec.feature 'Log out', type: :feature do
  scenario 'Log out should not appear if user is not logged in' do
    visit '/'
    expect(page).not_to have_link("Log out")
  end

  scenario 'Log out should appear if user is logged in' do
    visit '/'
    fill_in 'user[email_address]', with: 'myemail@gmail.com'
    fill_in 'user[password]', with: 'mypassword'
    click_button 'Sign up'

    # once signing in actually logs you in we can delete this part:
    visit '/login'
    fill_in 'Email address', with: 'myemail@gmail.com'
    fill_in 'Password', with: 'mypassword'
    click_button 'Log in'

    expect(page).to have_link("Log out")
  end

  scenario 'Clicking log out should log you out' do
    visit '/'
    fill_in 'user[email_address]', with: 'myemail@gmail.com'
    fill_in 'user[password]', with: 'mypassword'
    click_button 'Sign up'

    # once signing in actually logs you in we can delete this part:
    visit '/login'
    fill_in 'Email address', with: 'myemail@gmail.com'
    fill_in 'Password', with: 'mypassword'
    click_button 'Log in'

    click_link("Log out")
    expect(page).not_to have_link("Log out")
  end

end
