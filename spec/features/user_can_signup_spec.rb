# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  context 'Form data' do
    scenario 'it has an email field' do
      go_to_homepage

      expect(page).to have_field('user[email]')
    end

    scenario 'it has a password field' do
      go_to_homepage

      expect(page).to have_field('user[password]')
    end

    scenario 'it has a name field' do
      go_to_homepage

      expect(page).to have_field("user[user_name]")
    end

    scenario 'it has a password confirmation field' do
      go_to_homepage

      expect(page).to have_field('user[password_confirmation]')
    end
  end

  context 'User must fill in a valid password' do
    scenario 'user left password field empty' do
      sign_up(user_name: 'test', email: 'test@test.com', password: '', password_confirmation: '')

      expect(page).to have_content('Password can\'t be blank')
      expect(page).to have_content('Password is too short (minimum is 6 characters)')
    end

    scenario 'user provides a password shorter than 6 characters' do
      sign_up(user_name: 'test', email: 'test@test.com', password: '12345', password_confirmation: '12345')

      expect(page).to have_content('Password is too short (minimum is 6 characters)')
    end

    scenario 'user provides a password longer than 10 characters' do
      sign_up(user_name: 'test', email: 'test@test.com', password: '12345678910', password_confirmation: '12345678910')

      expect(page).to have_content('Password is too long (maximum is 10 characters)')
    end

    scenario "user must provide passwords that match" do
      sign_up(user_name: 'test', email: 'test@test.com', password: '1234567', password_confirmation: '7654321')

      expect(page).to have_content('Password confirmation doesn\'t match Password')
    end
  end

  context 'User must provide a valid email address' do
    scenario 'user left email field empty' do
      sign_up(user_name: 'test', email: '', password: '123456789', password_confirmation: '123456789')

      expect(page).to have_content("Email can't be blank")
    end

    scenario 'user provides an email address that has already been taken' do
      sign_up(user_name: 'test', email: 'test@test.com', password: '123456789', password_confirmation: '123456789')
      click_link('Sign out')
      sign_up(user_name: 'test', email: 'test@test.com', password: '12345', password_confirmation: '12345')

      expect(page).to have_content('Email has already been taken')
    end

    scenario 'user provides an email address that doesn\'t have \'at sign\'' do
      sign_up(user_name: 'test', email: 'testtest.com', password: '123456789', password_confirmation: '123456789')

      expect(page).to have_content('Email is invalid')
    end

    scenario "user provides an email address that doesn't have unique user name" do
      sign_up(user_name: 'test', email: '@test.com', password: '123456789', password_confirmation: '123456789')

      expect(page).to have_content('Email is invalid')
    end

    scenario 'user provides an email address that doesn\'t have domain name' do
      sign_up(user_name: 'test', email: 'test@', password: '123456789', password_confirmation: '123456789')

      expect(page).to have_content('Email is invalid')
    end
  end

  context 'User must provide a user name' do
    scenario 'user leaves user name field empty' do
      sign_up(user_name: '', email: 'test@test.com', password: '123456789', password_confirmation: '123456789')

      expect(page).to have_content('User name can\'t be blank')
    end

    scenario 'user doesn\'t provide a unique user name' do
      sign_up(user_name: 'test', email: 'test@test.com', password: '123456789', password_confirmation: '123456789')
      click_link 'Sign out'
      sign_up(user_name: 'test', email: 'test@test.co.uk', password: '123456789', password_confirmation: '123456789')
      expect(page).to have_content('User name has already been taken')
    end

  end

  scenario 'after completing the signup form it navigates to posts page' do
    sign_up(user_name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')

    expect(page).to have_current_path('/posts')
    expect(page).to have_content('Welcome to Acebook by D-Railed!')
  end
end
