# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User can make a comment on a post", type: :feature do
  scenario "successfully" do
    sign_up_successfully

    fill_in "post_message", with: "test text"
    click_button 'Post'

    fill_in 'comment_content', with: 'This is a text comment on the post'
    click_button "Comment"

    expect(page).to have_content("This is a text comment on the post")
  end

  scenario "Notices user if comment too long" do
    comment_that_is_too_long = "This comment is too long. This comment is too long.
      This comment is too long. This comment is too long. This comment is too long.
      This comment is too long. This comment is too long. This comment is too long.
      This comment is too long. This comment is too long. This comment is too long."

    sign_up_successfully

    fill_in "post_message", with: "Test text"
    click_button 'Post'

    fill_in 'comment_content', with: comment_that_is_too_long
    click_button "Comment"

    expect(page).not_to have_content(comment_that_is_too_long)
  end
end
