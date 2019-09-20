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
    scenario "Posts are only displayed on the wall they are created on" do
      sign_up
      click_link "All Posts"
      click_link "New post"
      fill_in "Message", with: "Hello, this is a global post"
      click_button "Submit"
      click_link "My Wall"
      click_link "New post"
      fill_in "Message", with: "Hello, this is a post on my wall"
      click_button "Submit"
      expect(page).not_to have_content("Hello, this is a global post")
      expect(page).to have_content("Hello, this is a post on my wall")
    end

    scenario "When posting on the main wall posts are only displayed there." do
      sign_up
      click_link "New post"
      fill_in "Message", with: "Hello, this is on my wall"
      click_button "Submit"
      click_link "All Posts"
      click_link "New post"
      fill_in "Message", with: "Hello, this is on the global wall"
      click_button "Submit"
      expect(page).not_to have_content("Hello, this is on my wall")
      expect(page).to have_content("Hello, this is on the global wall")
    end
  end
end
