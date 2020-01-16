require 'rails_helper'

RSpec.feature "Update", type: :feature do
  scenario "Can update posts they have created" do
    visit "/signup"
    fill_in "Name", with: "Ben"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "1234"
    fill_in "Confirm Password", with: "1234"
    click_button "Sign up"
    visit "/login"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "1234"
    click_button "Log in"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")
    click_on "Edit"
    fill_in "Message", with: "Updated message"
    click_button "Submit"
    expect(page).to have_content("Updated message")
  end
end
