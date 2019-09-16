require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Users only view own posts on initial page" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test1@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Hello, this is user 1"
    click_button "Submit"
    click_link "Logout"
    visit "/users/sign_up"
    fill_in "user[email]", with: "test2@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Howdy, I'm user 2"
    click_button "Submit"
    expect(page).to have_content("Howdy, I'm user 2")
    expect(page).not_to have_content("Hello, this is user 1")
  end
end
