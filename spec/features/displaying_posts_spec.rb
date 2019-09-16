require "rails_helper"

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
end
