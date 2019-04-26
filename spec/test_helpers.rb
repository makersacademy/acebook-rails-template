# frozen_string_literal: true

def sign_up(email: "myemail@hotmail.com", password: "password")
  visit "/"
  fill_in "Email address", with: email
  fill_in "Password", with: password
  click_button "Sign up"
end

def log_in(email: "myemail@hotmail.com", password: "password")
  visit "/login"
  fill_in "Email address", with: email
  fill_in "Password", with: password
  click_button "Log in"
end

def create_post(message: 'Hello m0m')
    visit "/posts"
    click_link "Create new post"
    fill_in "Message", with: message
    click_button "Submit"
end
