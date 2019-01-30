# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  scenario "A user signs up and see's their account details" do
    signup_and_click

    expect(page).to have_content('Test 001')
    expect(page).to have_content('Test100@test.com')
    expect(page).to_not have_content('Password001')
  end

  scenario "A user has to sign up with an email address" do
      visit '/signup'
      fill_in 'users_username', with: 'Test 001'
      fill_in 'users_password', with: 'Password001'
      find('input[name="commit"]').click

      expect(page).to have_content('Email is not valid')
    end

  end
