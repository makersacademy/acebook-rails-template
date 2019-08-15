# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'login', type: :feature do
  scenario 'Throws error with invalid input' do
    visit '/login'
    fill_in 'session[email]', with: 'test@gmail.com'
    fill_in 'session[password]', with: 'foo'
    click_button 'Log in'
    expect(page).to have_content('Invalid email/password combination')
  end

  scenario 'Throws error with invalid input' do
    User.create(username: 'test_user', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    visit '/login'
    fill_in 'session[email]', with: 'test@example.com'
    fill_in 'session[password]', with: 'password123'
    click_button 'Log in'
    expect(page).to have_content('Account')
    expect(page).not_to have_content('Login')
  end
end
