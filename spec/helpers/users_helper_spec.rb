require 'rails_helper'

def newpost
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def signup
  visit("/users/new")
  fill_in "Name", with: "Kaja P"
  fill_in "Username", with: "KP"
  fill_in "Email", with: "kaja@hotmail.com"
  fill_in "Password", with: "pa$$word"
  click_button "Sign Up"
end
