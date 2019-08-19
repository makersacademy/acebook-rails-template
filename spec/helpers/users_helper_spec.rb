require 'rails_helper'

def signup
    visit("/users/new")
    fill_in 'name', with: "Marvin"
    fill_in 'email', with: "m@gmail.com"
    fill_in 'username', with: "Marvin1"
    fill_in 'password', with: "123456789"
    fill_in 'password_confirmation', with: "123456789"
    click_button "Create my account"
end


def login
  visit "/login"
  fill_in 'email', with: "m@gmail.com"
  fill_in 'password', with: "123456789"
  click_button "Log in"
end

def newpost
  visit('/')
  click_link 'New post'
  fill_in 'Message', with: 'Marvin Marvin'
  click_button 'Submit'
end
