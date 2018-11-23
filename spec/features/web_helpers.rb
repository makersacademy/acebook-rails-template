# frozen_string_literal: true

def post_message(message:)
  click_link 'New post'
  fill_in :post_message, with: message
  click_button 'Submit'
end

def comment(body:)
  click_button 'Comment'
  fill_in('Body', with: body )
  click_button 'Submit'
end

def sign_up(user_name:, user_email:, user_password:)
  visit('/')
  click_link('Register')
  fill_in(:user_name, with: user_name)
  fill_in(:user_email, with: user_email)
  fill_in(:user_password, with: user_password)
  fill_in(:user_password_confirmation, with: user_password)
  click_button 'Sign up'
end

def login(email:, password:)
  visit('/')
  click_link('Login')
  fill_in(:user_email, with: email)
  fill_in(:user_password, with: password)
  click_button "Log in"
end
