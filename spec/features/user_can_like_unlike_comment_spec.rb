require 'rails_helper'

RSpec.feature "User can like or unlike comment", type: :feature do
  scenario "User can like a comment" do
    user_sign_up
    fill_in "post_message", with: "Hello world!"
    click_button "Post"
    fill_in "comment[comment]", with: "Morning"
    click_button "Comment"
    click_on(class: 'like_comment')
    expect(page).to have_content("1 Like")
  end

  scenario "User can unlike a comment" do
    user_sign_up
    fill_in "post_message", with: "Hello world!"
    click_button "Post"
    fill_in "comment[comment]", with: "Morning"
    click_button "Comment"
    click_on(class: 'like_comment')
    click_on(class: 'unlike_comment')
    expect(page).to have_content("0 Likes")
  end
end
