require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "Submitting Posts", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Users only view own posts on initial page" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, this is user 1"
    click_button "Submit"
    click_link "Logout"
    sign_up_other_user
    expect(page).not_to have_content("Hello, this is user 1")
  end

  scenario "User 2 creates post on User 1's wall, post shows on User 1 wall" do
    sign_up
    click_link "All Posts"
    click_link "New post"
    fill_in "Message", with: "Hello, this is user 1"
    click_button "Submit"
    click_link "Logout"
    sign_up_other_user
    click_link "All Posts"
    within(".card-body") do
    click_link "test@gmail.com"
    end
    click_link "New post"
    fill_in "Message", with: "This is user 2, posting on user 1's wall"
    click_button "Submit"
    expect(page).to have_content("This is user 2, posting on user 1's wall")
    click_link "test_other@gmail.com"
    expect(page).not_to have_content("This is user 2, posting on user 1's wall")
  end
end
