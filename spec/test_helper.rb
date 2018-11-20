ENV['RAILS_ENV'] ||= 'test'
require 'rails_helper'


def is_logged_in?
  !session[:user_id].nil?
end

def sign_up
  visit '/'
  fill_in 'Name', with: 'Amy Smith'
  fill_in 'Email', with: 'amy@mail.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password Confirmation', with: 'password'
  click_button 'Create my account'
end

def log_out
  click_link 'Log out'
end

def log_in
  click_link 'Log in'
  fill_in 'Email', with: 'amy@mail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end
