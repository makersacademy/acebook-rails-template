require 'rails_helper'

RSpec.feature 'User', type: :feature do

  scenario 'User can login and views own wall' do
    user_signup_helper
    click_button 'Log Out'
    visit '/'
    click_button 'Login'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test1234'
    click_button 'Login'
    expect(page).to have_content('Welcome to your wall, test@test.com')
  end

  scenario 'Email not in db returns error' do
    visit '/'
    click_button 'Login'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test1234'
    click_button 'Login'
    expect(page).to have_content("sEa-mail address dopes not exist - please sign up")
  end

  scenario 'Password does not match db password returns error' do
    user_signup_helper
    click_button 'Log Out'
    visit '/'
    click_button 'Login'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'wrongpassword'
    click_button 'Login'
    expect(page).to have_content("FINcorrect Password")
  end

end

