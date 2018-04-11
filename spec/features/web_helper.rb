
# frozen_string_literal: true

def add_new_post
  sign_up

end

def sign_up
  visit '/'
  click_link 'Register'
  fill_in 'Email', with: 'hello@live.com'
  fill_in 'Password', with: 'password123'
  fill_in 'Password confirmation', with: 'password123'
  click_button 'Sign up'
end

def sign_in
  visit '/'
  click_link 'Login'
  fill_in 'Email', with: 'hello@live.com'
  fill_in 'Password', with: 'password123'
  click_button 'Log in'
end

def sign_out
  visit '/'
  click_link 'Logout'
end

def add_comment
  click_link 'Show'
  fill_in 'comment[commenter]', with: 'Charlene'
  fill_in 'comment[body]', with: 'Rails is awesome!'
  click_button 'Create Comment'
end
