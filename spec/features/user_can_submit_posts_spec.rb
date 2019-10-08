require 'rails_helper'

RSpec.feature "User Page", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/new"
    fill_in "user[username]", with: "NewUser123"
    fill_in "user[email]", with: "newuser123@gmail.com"
    fill_in "user[password]", with: "password1"
    choose('user[ethnicity]', option: "asian")
    click_button "Sign Up"
    expect(page).to have_content("Welcome NewUser123!")
    fill_in "post[message]", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
