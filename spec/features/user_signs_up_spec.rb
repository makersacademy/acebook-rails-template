# require 'spec_helper'

# feature 'User signs up' do
#   scenario 'with valid email and password' do
#     user_sign_up 'valid@example.com', 'password'

#     expect(page).to have_content('Sign out')
#   end

#   scenario 'with invalid email' do
#     user_sign_up 'invalid_email', 'password'

#     expect(page).to have_content('Sign in')
#   end

#   scenario 'with blank password' do
#     user_sign_up 'valid@example.com', ''

#     expect(page).to have_content('Sign in')
#   end

#   # def sign_up_with(email, password)
#   #   visit "/users/sign_up"
#   #   fill_in 'Email', with: email
#   #   fill_in 'Password', with: password
#   #   click_button 'Sign up'
#   # end
# end