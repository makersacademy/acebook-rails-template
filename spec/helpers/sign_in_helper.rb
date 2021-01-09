require 'rails_helper'

def sign_in
  User.create(email: 'testenv@example.com', password: 'testpass')
  visit '/users/sign_in'
  fill_in 'Email', with: 'testenv@example.com'
  fill_in 'Password', with: 'testpass'
  click_button 'Log in'
end
