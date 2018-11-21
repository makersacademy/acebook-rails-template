# frozen_string_literal: true

def post_message(message:)
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: message
  click_button 'Submit'
end

def login(email:, password:)
  visit('/')
  click_link('Login')
  fill_in(:user_email, with: email)
  fill_in(:user_password, with: password)
  click_button 'Log in'
end
