# frozen_string_literal: true

require 'rails_helper'

def first_user
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: 'BruceBatman'
  fill_in 'First name', with: 'Bruce'
  fill_in 'Surname', with: 'Wayne'
  fill_in 'Email', with: 'batman@gmail.com'
  fill_in 'Password', with: 'batman123'
  fill_in 'Password confirmation', with: 'batman123'
  click_button 'Sign up'
  click_link 'New post'
  fill_in 'Message', with: 'I\'m Batman!!!'
  click_button 'Submit'
  click_link 'Log Out'
end

def second_user
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: 'ClarkKent'
  fill_in 'First name', with: 'Clark'
  fill_in 'Surname', with: 'Kent'
  fill_in 'Email', with: 'superman@gmail.com'
  fill_in 'Password', with: 'superman123'
  fill_in 'Password confirmation', with: 'superman123'
  click_button 'Sign up'
  click_link 'New post'
  fill_in 'Message', with: 'Superman to the rescue!!!'
  click_button 'Submit'
  click_link 'Log Out'
end

def third_user
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: 'DianaPrince'
  fill_in 'First name', with: 'Diana'
  fill_in 'Surname', with: 'Prince'
  fill_in 'Email', with: 'wonderwoman@gmail.com'
  fill_in 'Password', with: 'wonder123'
  fill_in 'Password confirmation', with: 'wonder123'
  click_button 'Sign up'
  click_link 'New post'
  fill_in 'Message', with: 'Never fear, Wonder Woman is here!!!'
  click_button 'Submit'
  click_link 'Log Out'
end

def first_user_sign_in
  visit '/'
  fill_in 'Email', with: 'batman@gmail.com'
  fill_in 'Password', with: 'batman123'
  click_button 'Log in'
end
