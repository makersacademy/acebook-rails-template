# frozen_string_literal: true

require './spec/web_helper.rb'

feature 'user log in' do
  scenario 'user log in with right credentials' do
    sign_up
    click_link('Sign Out')
    click_link('Sign In')
    fill_in 'session[email]', with: 'umberto@acebook.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Welcome umberto@acebook.com')
  end

  scenario 'wrong or not existing email' do
    visit('/')
    click_link('Sign In')
    fill_in 'session[email]', with: 'umberto@acebook.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Incorrect email or password')
  end

  scenario 'wrong password for existing user' do
    sign_up
    click_link('Sign Out')
    click_link('Sign In')
    fill_in 'session[email]', with: 'umberto@acebook.com'
    fill_in 'session[password]', with: 'wrongPassword'
    click_button 'Sign in'
    expect(page).to have_content('Incorrect email or password')
  end
end
