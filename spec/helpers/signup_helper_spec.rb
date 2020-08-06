require 'rails_helper'

def user_sign_up
  visit '/people/sign_up'
  fill_in 'person_email', with: 'bob@yahoo.com'
  fill_in 'person_password', with: 'password123'
  fill_in 'person_password_confirmation', with: 'password123'
  click_button 'Sign up'
end