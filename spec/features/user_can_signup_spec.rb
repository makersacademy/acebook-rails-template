require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'Logged out users should be redirected from posts to sign up page' do
    visit '/posts'
    expect(page).to have_current_path("/")
  end

  scenario 'Logged out users should get see a message when they get redirected' do
    visit '/posts/new'
    expect(page).to have_content('You must be logged in to access that page')
  end

  scenario 'Signup form should have email address and password fields' do
    visit '/'
    expect(page).to have_field("user[email_address]")
    expect(page).to have_field("user[password]")
  end

  scenario 'Completing the signup form navigates to posts route' do
    sign_up
    expect(page).to have_current_path("/posts")
  end

  scenario 'Completing the signup form signs you in' do
    sign_up
    expect(page).to have_link("Log out")
  end

  scenario 'After completing the signup form succesfully the user sees a confirmation mesage' do
    sign_up
    expect(page).to have_content("New account created")
  end

  context 'User must provide a valid email address' do
    scenario 'User must provide an email address' do
      sign_up(email = '', password = 'abc123')
      expect(page).to have_content("Could not create account")
    end

    scenario 'Email address must contain "@" symbol' do
      sign_up(email = 'myemail', password = 'abc123')
      expect(page).to have_content("Could not create account")
    end

    scenario 'Email address must have a local part' do
      sign_up(email = '@myemail', password = 'abc123')
      expect(page).to have_content("Could not create account")
    end

    scenario 'Email address must have a domain' do
      sign_up(email = 'myemail@', password = 'abc123')
      expect(page).to have_content("Could not create account")
    end

    scenario 'Email address must have a TLD' do
      sign_up(email = 'myemail@domain', password = 'abc123')
      expect(page).to have_content("Could not create account")
    end

    scenario 'Email must be unique' do
      sign_up(email = 'myemail@hotmail.com', password = 'abc123')
      sign_up(email = 'myemail@hotmail.com', password = 'xyx789')
      expect(page).to have_content("Could not create account")
    end

    scenario 'Email must be unique disregarding case' do
      sign_up(email = 'myemail@hotmail.com', password = 'abc123')
      sign_up(email = 'myemail@HOTMAIL.com', password = 'xyx789')
      expect(page).to have_content("Could not create account")
    end
  end

  context 'User must provide a valid password' do
    scenario 'User must provide a password' do
      sign_up(email = 'myemail@hotmail.com', password = '')
      expect(page).to have_content("Could not create account")
    end

    scenario 'Password must be at least 6 characters' do
      sign_up(email = 'myemail@hotmail.com', password = '12345')
      expect(page).to have_content("Could not create account")
    end

    scenario 'Password must be at most 10 characters' do
      sign_up(email = 'myemail@hotmail.com', password = '1234567890a')
      expect(page).to have_content("Could not create account")
    end
  end
end
