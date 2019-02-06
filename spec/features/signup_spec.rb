# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  xscenario "A user signs up and see's their account details" do
    signup_and_click

    expect(page).to have_content('Test 001')
  end

  scenario 'A user has to sign up with an email address' do
    # Arranging my data
    visit '/signup'
    fill_in 'users_username', with: 'Test 001'
    fill_in 'users_password', with: 'Password001'
    # Act on my data
    find('input[name="commit"]').click
    # Assert the behaviour of my action
    expect(page).to have_content('Email cannot be blank')
  end

  scenario 'A user has to sign up with a 5 character minimum password' do
    # Arranging my data
    visit '/signup'
    fill_in 'users_username', with: 'Test 001'
    fill_in 'users_email', with: 'test0001@makers.com'
    fill_in 'users_password', with: 'Pass'
    # Act on my data
    find('input[name="commit"]').click
    # Assert the behaviour of my action
    expect(page).to have_content('Password is too short')
  end

  scenario 'A user has to sign up with a unique email address' do
    # Arranging my data
    visit '/signup'
    fill_in 'users_username', with: 'Test A'
    fill_in 'users_email', with: 'TestA@test.com'
    fill_in 'users_password', with: 'Password001'
    # Act on my data
    find('input[name="commit"]').click
    # Arranging my data
    visit '/signup'
    fill_in 'users_username', with: 'Test 003'
    fill_in 'users_email', with: 'TestA@test.com'
    fill_in 'users_password', with: 'Password003'
    # Act on my data
    find('input[name="commit"]').click
    # Assert the behaviour of my action
    expect(page).to have_content('Email is not unique')
  
  end
end
