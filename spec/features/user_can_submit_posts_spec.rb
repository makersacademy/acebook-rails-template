require 'rails_helper'

RSpec.feature "User Page", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "newuser123@gmail.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    click_button
    expect(page).to have_content("Welcome newuser123@gmail.com!")
    fill_in "post[message]", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
