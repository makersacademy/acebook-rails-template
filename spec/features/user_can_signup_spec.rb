require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'Signup form should have email address and password fields' do
    visit '/'
    expect(page).to have_field("user[email_address]")
    expect(page).to have_field("user[password]")
  end

  scenario 'Completing the signup form navigates to posts route' do
    visit '/'
    fill_in 'user[email_address]', with: 'myemail@gmail.com'
    fill_in 'user[password]', with: 'mypassword'
    click_button 'Sign up'
    expect(page).to have_current_path("/posts")
  end

  scenario 'After completing the signup form succesfully the user sees a confirmation mesage' do
    visit '/'
    fill_in 'user[email_address]', with: 'myemail@gmail.com'
    fill_in 'user[password]', with: 'mypassword'
    click_button 'Sign up'
    expect(page).to have_content("New account created")
  end

  scenario 'After completing the signup form succesfully the user sees a confirmation mesage' do
    visit '/'
    fill_in 'user[email_address]', with: 'myemail@gmail.com'
    fill_in 'user[password]', with: 'mypassword'
    click_button 'Sign up'
    expect(page).to have_content("New account created")
  end
end
