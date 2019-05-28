# frozen_string_literal: true

def create_new_user
  visit '/users/sign_up'
  fill_in 'user_email', with: 'example@example.com'
  fill_in 'user_password', with: 'examplepassword'
  fill_in 'user_password_confirmation', with: 'examplepassword'
  click_button 'Sign up'
end
