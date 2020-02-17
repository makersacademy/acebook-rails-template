# frozen_string_literal: true

def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: 'cats@cats.com'
  fill_in 'Password', with: 'cats1234'
  fill_in 'Password confirmation', with: 'cats1234'
  click_button 'Sign Up'
end

def sign_up_two
  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: 'cat2@cats.com'
  fill_in 'Password', with: 'cats1234'
  fill_in 'Password confirmation', with: 'cats1234'
  click_button 'Sign Up'
end

def new_post
  visit '/posts'
  click_link 'New post'
  fill_in "area", with: 'Hello, world!'
  click_button 'Submit'
end

def log_in
  sign_up
  visit '/'
  click_link 'Logout'
  click_link 'Login'
  fill_in 'Email', with: 'cats@cats.com'
  fill_in 'Password', with: 'cats1234'
  click_button 'Log in'
end

