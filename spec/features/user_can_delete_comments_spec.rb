require 'rails_helper'

RSpec.feature "User can delete a comment", type: :feature do
  scenario "User creates and delete the comment" do
    user_sign_up

    fill_in "post_message", with: "Hello, world!"
    click_button "Post"
    fill_in "comment[comment]", with: "Morning"
    click_button "Comment"
    find(".comment").click_link("DELETE")

    expect(page).not_to have_content("Morning")
  end
end
