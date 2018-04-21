require 'rails_helper'

RSpec.feature "User can like or unlike comment", type: :feature do
  scenario "User can like a comment" do
    user_sign_up
    fill_in "post-message", with: "Hello world!"
    click_button "Post"
    fill_in "comment[comment]", with: "Morning"
    click_button "Comment"
    click_link('like-comment')
    expect(page).to have_content("1 Like")
  end

  scenario "User can unlike a comment" do
    user_sign_up
    fill_in "post-message", with: "Hello world!"
    click_button "Post"
    fill_in "comment[comment]", with: "Morning"
    click_button "Comment"
    click_link('like-comment')
    click_link('unlike-comment')

    expect(page).to have_content("0 Likes")
  end
end
