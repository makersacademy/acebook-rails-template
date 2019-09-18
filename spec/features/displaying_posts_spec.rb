require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "Displaying Posts", type: :feature do
  scenario "Posts are displayed with newest post first" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, this is my first post"
    click_button "Submit"
    # wait for some time
    click_link "New post"
    fill_in "Message", with: "Hello, this is my second post"
    click_button "Submit"
    expect("Hello, this is my second post").to appear_before("Hello, this is my first post")
  end

  scenario "Once logged in, users redirected to page that shows own posts only" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, this is User 1's post"
    click_button "Submit"
    click_link "Logout"
    sign_up_other_user
    expect(page).not_to have_content("Hello, this is User 1's post")
  end

  feature "User Walls" do
    scenario "A user can visit another user's wall and only that user's posts are displayed" do
      sign_up
      click_link "New post"
      fill_in "Message", with: "Hello, this is User 1's post"
      click_button "Submit"
      click_link "Logout"
      sign_up_other_user
      click_link "New post"
      fill_in "Message", with: "Hello, this is User 2's post"
      click_button "Submit"
      click_link "test@gmail.com"
      expect(page).not_to have_content("Hello, this is User 2's post")
      expect(page).to have_content("Hello, this is User 1's post")
    end
  end
end
