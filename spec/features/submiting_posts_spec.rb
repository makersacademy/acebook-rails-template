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
end
