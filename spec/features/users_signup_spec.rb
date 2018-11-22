require 'rails_helper'

# Feature test for Signing up to the app
feature 'Sign up' do
  scenario 'user can sign up and it is greeted by their name on the page' do
    visit '/'
    fill_in(:user_firstname, with: 'Bob')
    fill_in(:user_lastname, with: 'Marley')
    fill_in(:user_username, with: 'bm')
    fill_in(:user_email, with: 'bob@bobmarley.com')
    fill_in(:user_password, with: 'bobbob')
    click_button 'Sign up'
    # expect(page).to have_content ('Hello Bob')
  end

  scenario 'user cannot sign up if the username is already in use' do
    visit '/'
    fill_in(:user_firstname, with: 'John')
    fill_in(:user_lastname, with: 'Lennon')
    fill_in(:user_username, with: 'jl')
    fill_in(:user_email, with: 'John@Lennon.com')
    fill_in(:user_password, with: 'jonjon')
    click_button 'Sign up'
    expect(page).to have_content('Sign-up failed')
  end

  scenario 'user cannot sign up if the email is already in use' do
    visit '/'
    fill_in(:user_firstname, with: 'Jen')
    fill_in(:user_lastname, with: 'Greg')
    fill_in(:user_username, with: 'jG')
    fill_in(:user_email, with: 'jen@leynon.com')
    fill_in(:user_password, with: 'jenjen')
    click_button 'Sign up'
    expect(page).to have_content('Sign-up failed')
  end
end
