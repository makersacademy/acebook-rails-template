
# frozen_string_literal: true

def sign_up
  visit '/'
  click_button 'Register'
  fill_in 'Name', with: 'Tom'
  fill_in 'Username', with: 'Tom123'
  fill_in 'Email', with: 'hello@live.com'
  fill_in 'Password', with: 'password123'
  fill_in 'Password confirmation', with: 'password123'
  click_button 'Sign up'
end

def sign_up2
  visit '/'
  click_button 'Register'
  fill_in 'Name', with: 'Jerry'
  fill_in 'Username', with: 'Jerry123'
  fill_in 'Email', with: 'byebye@live.com'
  fill_in 'Password', with: 'password123'
  fill_in 'Password confirmation', with: 'password123'
  click_button 'Sign up'
end

def sign_in
  visit '/'
  click_button 'Login'
  fill_in 'Email', with: 'hello@live.com'
  fill_in 'Password', with: 'password123'
  click_button 'Log in'
end

def sign_in2
  visit '/'
  click_button 'Login'
  fill_in 'Email', with: 'byebye@live.com'
  fill_in 'Password', with: 'password123'
  click_button 'Log in'
end

def sign_out
  visit '/'
  click_button 'Logout'
end

def add_new_post
  visit '/posts'
  click_link 'New post'
  fill_in 'post[message]', with: 'Hello, world!'
  click_button 'Submit'
end

def add_comment
  click_button 'Show'
  fill_in 'comment[body]', with: 'Rails is awesome!'
  click_button 'Create Comment'
end

def sign_up_second_user
  visit '/'
  click_button 'Register'
  fill_in 'Name', with: 'Charlene'
  fill_in 'Username', with: 'Char'
  fill_in 'Email', with: 'test@live.com'
  fill_in 'Password', with: 'password123'
  fill_in 'Password confirmation', with: 'password123'
  click_button 'Sign up'
end

def second_user_add_post
  visit '/posts'
  click_link 'New post'
  fill_in 'post[message]', with: 'Makers Academy is awesome!'
  click_button 'Submit'
end
