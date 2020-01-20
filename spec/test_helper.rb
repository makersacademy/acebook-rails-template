require 'rails_helper'

def sign_up
  visit '/sign_up'
  fill_in 'user_email', with: 'dan@test.com'
  fill_in 'user_password', with: 'p123456'
  fill_in 'confirmation-password', with: 'p123456'
  click_on 'Sign up'
end

def new_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def sign_up_with_less_character
  visit '/sign_up'
  fill_in 'user_email', with: 'dan@test.com'
  fill_in 'user_password', with: 'p12'
  fill_in 'confirmation-password', with: 'p12'
  click_on 'Sign up'
end

def sign_up_with_more_character
  visit '/sign_up'
  fill_in 'user_email', with: 'dan@test.com'
  fill_in 'user_password', with: 'p12234567789'
  fill_in 'confirmation-password', with: 'p12234567789'
  click_on 'Sign up'
end

def sign_up__password_confirmation_no_match
  visit '/sign_up'
  fill_in 'user_email', with: 'dan@test.com'
  fill_in 'user_password', with: 'p122345'
  fill_in 'confirmation-password', with: 'p1223455699'
  click_on 'Sign up'
end
