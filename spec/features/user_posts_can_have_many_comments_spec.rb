require 'rails_helper'

RSpec.feature "Posts can have many comments", type: :feature do
  scenario "User can add comments to post" do
    user_sign_up
    fill_in "post_message", with: "Hello, world!"
    click_button "Post"
    fill_in "comment[comment]", with: "Morning"
    click_button "Comment"
    expect(page).to have_content("Morning")
  end
end
