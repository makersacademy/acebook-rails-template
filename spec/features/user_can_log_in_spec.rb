require 'rails_helper'

RSpec.feature 'User log in' do
  scenario 'log in form on log in' do
    sign_up
    click_link 'Log out'
    click_link 'Log in' 
    fill_in 'session[email]', with: 'testjohnson@testmail.com'
    fill_in 'session[password]', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Welcome to Acebook!'
  end
end
