# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing in', type: :feature do
  scenario 'successful sign in' do
    visit('/')
    click_link('Login')
    fill_in(:user_email, with: 'test@user.com')
    fill_in(:user_password, with: 'qwerty')
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq '/posts'
  end

  scenario 'incorrect email' do
    visit('/')
    click_link('Login')
    fill_in(:user_email, with: 'test@uer.com')
    fill_in(:user_password, with: 'qwerty')
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'incorrect password' do
    visit('/')
    click_link('Login')
    fill_in(:user_email, with: 'test@user.com')
    fill_in(:user_password, with: 'qwrty')
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end
end
