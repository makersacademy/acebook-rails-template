# frozen_string_literal: true

require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Registration', type: :feature do
  scenario 'Can successfully register as a user' do
    signup
    expect(page).to have_content("Welcome to Acebook, Alfie!")
  end

  scenario 'Cannot sign up with invalid email/password' do
    visit('users/new')
    fill_in('Name', with: 'Alfie')
    fill_in('Email', with: 'invalid')
    fill_in('Password', with: 'password')
    click_button('Submit')
    expect(page).to have_content('Invalid email or password')
  end
end
