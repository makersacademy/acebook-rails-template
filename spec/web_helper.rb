# frozen_string_literal: true

def sign_up
  visit('/')
  click_link('Sign Up')
  fill_in 'user[email]', with: 'umberto@acebook.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Save User'
end

def create_post
  fill_in 'post[message]', with: 'test message'
  click_button 'Create Post'
end
