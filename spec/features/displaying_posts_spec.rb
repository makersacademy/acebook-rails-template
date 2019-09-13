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
    #Look at this on monday, use regex to test order of content on webpage
    expect(page).to have_content("Hello, this is my second post" +  + "Hello, this is my first post")
  end
end
