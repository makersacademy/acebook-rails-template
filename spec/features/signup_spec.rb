# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  scenario "A user signs up and see's their account details" do
    signup_and_click

    expect(page).to have_content('1')
  end

  scenario 'A user has to sign up with an email address' do
    signup_without_email

    expect(page).to have_content('Email cannot be blank')
  end

  scenario 'A user has to sign up with a 5 character minimum password' do
    signup_with_4_character_password

    expect(page).to have_content('Password is too short')
  end

  scenario 'A user has to sign up with a unique email address' do
    signup_twice_with_the_same_email

    expect(page).to have_content('Email is not unique')
  end
end
