require 'rails_helper'

RSpec.feature 'User', type: :feature do

  scenario 'User can login and views own wall' do
    register_user

    visit '/logout'

    visit '/'
    click_link_or_button 'Login'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test1234'
    click_link_or_button 'Login'
    expect(page).to have_content('Welcome to your wall, Test')
  end

  scenario 'Email not in db returns error' do
    visit '/'
    click_link_or_button 'Login'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test1234'
    click_link_or_button 'Login'
    expect(page).to have_content("sEa-mail address dopes not exist - please sign up")
  end

  scenario 'Password does not match db password returns error' do
    register_user
    visit '/logout'
    visit '/'
    click_link_or_button 'Login'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'wrongpassword'
    click_link_or_button 'Login'
    expect(page).to have_content("FINcorrect Password")
  end

end

