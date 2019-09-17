require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "Displaying Posts", type: :feature do
  scenario "Posts are displayed with newest post first" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test1@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Hello, this is my first post"
    click_button "Submit"
    # wait for some time
    click_link "New post"
    fill_in "Message", with: "Hello, this is my second post"
    click_button "Submit"
    expect("Hello, this is my second post").to appear_before("Hello, this is my first post")
  end

  xscenario "Once logged in, users redirected to page that shows own posts only" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, this is User 1's post"
    click_button "Submit"
    click_link "Logout"
    sign_up_other_user
    click_link "New post"
    fill_in "Message", with: "Howdy, this is User 2's post"
    click_button "Submit"
    expect(page).to have_content("Howdy, this is User 2's post")
    expect(page).not_to have_content("Hello, this is User 1's post")
  end
end
