# frozen_string_literal: true

def sign_up
  visit('/')
  click_link('Sign Up')
  fill_in 'user[username]', with: 'uvalente'
  fill_in 'user[email]', with: 'umberto@acebook.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Register'
end

def sign_up_two
  visit('/')
  click_link('Sign Up')
  fill_in 'user[username]', with: 'asia'
  fill_in 'user[email]', with: 'asia@acebook.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Register'
end

def create_post
  fill_in 'post[message]', with: 'test message'
  click_button 'Add post'
end

def create_comment
  fill_in 'comment[body]', with: 'test comment'
  click_button 'Add Comment'
end

def edit_comment
  fill_in 'comment[body]', with: 'Test comment 1'
  click_button 'Update comment'
end
