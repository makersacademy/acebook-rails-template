require 'rails_helper'

RSpec.feature 'log in denied' do
  scenario 'when email not correct' do
    sign_up
    click_link('Log out')
    click_link('Log in')
    fill_in 'session[email]', with: 'wrongjohnson@testmail.com'
    fill_in 'session[password]', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Invalid email/password combination')
  end
  scenario 'cannot sign up with already used email' do
    sign_up
    click_link('Log out')
    sign_up
    expect(page).to have_content('Email has already been taken')
  end
end
