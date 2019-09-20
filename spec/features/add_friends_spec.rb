require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "Adding friends", type: :feature do
  scenario "Can see a list of users to add as a friend" do
    sign_up
    click_link "Logout"
    sign_up_other_user
    click_link "All Posts"
    expect(page).to have_content("Add Friend")
  end

  scenario "Can add a friend from list of users on all posts wall" do
    sign_up
    click_link "Logout"
    sign_up_other_user
    click_link "All Posts"
    click_link "Add Friend"
    expect(page).to have_content("Friends")
  end

  scenario "Can remove a friend from our own wall" do
    sign_up
    click_link "Logout"
    sign_up_other_user
    click_link "All Posts"
    click_link "Add Friend"
    click_link "My Wall"
    click_link "Remove Friend"
    expect(page).to have_content("My Friends 0")
    expect(page).not_to have_content("My Friends 1")
  end

  scenario "Can add a friend from other users wall from their posts profile name" do
    sign_up
    click_link "Logout"
    sign_up_other_user
    click_link "All Posts"
    click_link "test@gmail.com"
    click_link "New post"
    fill_in "Message", with: "This is user 2, posting on user 1's wall"
    click_button "Submit"
    click_link "Logout"
    sign_up_third_user
    click_link "All Posts"
    click_link "test@gmail.com"
    within(".add-friends-btn") do
      expect(page).to have_content("Add Friend")
    end

  end
end
