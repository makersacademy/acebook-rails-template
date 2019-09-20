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

  scenario "Can add a friend" do
    sign_up
    click_link "Logout"
    sign_up_other_user
    click_link "All Posts"
    click_link "Add Friend"
    expect(page).to have_content("Friends")
  end

  scenario "Can remove a friend" do
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
end
