require 'rails_helper'

def signup
visit "/users/new"
fill_in :name, with: "Marvin"
fill_in :email, with: "m@gmail.com"
fill_in :username, with: "Marvin1"
fill_in :password, with: "123456789"
fill_in :password_confirmation, with: "123456789"
click_button "Create my account"
expect(page).to have_content("Marvin")
end


def login
  visit "/login"
  fill_in :name, with: "Marvin"
  fill_in :password, with: "123456789"
  click_button "Log in"
  expect(page).to have_content("Marvin")
end
