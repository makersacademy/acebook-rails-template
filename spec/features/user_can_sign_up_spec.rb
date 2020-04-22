# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing up', type: :feature do
  scenario 'a new user can sign up' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'user[email]', with: 'Ria@testing.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on 'Sign Up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
