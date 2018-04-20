require 'rails_helper'

RSpec.feature "Empty comments", type: :feature do
  scenario "User cannot post an empty comment" do
    user_sign_up

    fill_in "post_message", with: "Hello world in a post!"
    click_button "Post"

    fill_in "post_comment", with: nil
    click_button "Comment"

    expect(page).to have_content("Invalid comment")
  end
end
