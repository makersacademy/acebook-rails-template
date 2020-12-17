require 'rails_helper'

RSpec.feature 'User Sign In', type: :feature do
  scenario 'A registered user can sign in to use SCZL' do
    register
    click_link 'Sign Out'
    sign_in
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'An unregistered user cannot sign in' do
    sign_in
    expect(page).to have_content('Invalid Email or password')
    expect(page).not_to have_content('Signed in successfully')
  end

  scenario 'A user uses the wrong email to sign in' do
    register
    click_link 'Sign Out'
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: 'test3@test.com'
    fill_in 'Password', with: 'Test123'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
    expect(page).not_to have_content('Signed in successfully')
  end

  scenario 'A user uses the wrong password to sign in' do
    register
    click_link 'Sign Out'
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'Test1234'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
    expect(page).not_to have_content('Signed in successfully')
  end
end
