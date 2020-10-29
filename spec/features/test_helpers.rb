# frozen_string_literal: true

def add_new_post
  click_link 'Whats on your mind?'
  fill_in 'Message', with: 'Hello, world!'
  click_button 'Submit'
end

def sign_up
  visit '/'
  click_on 'Sign up'
  fill_in 'Name', with: 'Test'
  fill_in 'Email', with: 'user@test.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_on 'Confirm'
end

def sign_up_second_user
  click_on 'Sign up'
  fill_in 'Name', with: 'User2'
  fill_in 'Email', with: 'user2@test.com'
  fill_in 'Password', with: 'secret'
  fill_in 'Password confirmation', with: 'secret'
  click_on 'Confirm'
end

def add_comment
  click_link 'Add comment'
  fill_in 'Comment', with: 'First comment!!'
  click_button 'Submit'
end
