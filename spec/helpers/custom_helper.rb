# frozen_string_literal: true

require 'rails_helper'

def create_post
  visit '/posts'
  click_link 'New post'
  fill_in 'post[message]', with: 'Hello, world!'
  click_button 'Throw'
end

def create_comment
  create_post
  click_button 'New Comment'
  fill_in 'comment[body]', with: 'Hello, Mars!'
  click_button 'Comment'
end

def sign_up
  visit "/users/sign_up"
  fill_in "user[username]", with: "testUser"
  fill_in "user[email]", with: "example@email.com"
  fill_in "user[password]", with: "password"
  fill_in "user[password_confirmation]", with: "password"
  click_button "Sign up"
end

def sign_up_user_2
  visit "/users/sign_up"
  fill_in "user[username]", with: "testUserTwo"
  fill_in "user[email]", with: "example2@email.com"
  fill_in "user[password]", with: "password123"
  fill_in "user[password_confirmation]", with: "password123"
  click_button "Sign up"
end
