require 'rails_helper'

RSpec.feature "Posts can have many comments", type: :feature do
  scenario "User can add comments to post" do
    user_sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "Comment", with: "Morning"
    click_button "Submit"
    expect(page).to have_content("Morning")
  end
end
