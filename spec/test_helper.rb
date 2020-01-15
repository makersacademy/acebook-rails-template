require 'rails_helper'

def sign_up
  visit('/sign_up')
  fill_in 'user_email', with: 'dan@test.com'
  fill_in 'user_password', with: 'p1'
  click_on 'Sign up'
end

def new_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end
