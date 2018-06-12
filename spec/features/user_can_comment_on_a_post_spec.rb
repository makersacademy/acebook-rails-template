require 'rails_helper'

RSpec.feature "Comment", type: :feature do
  scenario "User can comment on a post", :comment do
    sign_up_and_sign_in
    make_a_text_post
    fill_in "comment_content", with: 'This is a comment!'
    click_button "Comment"
    expect(page).to have_content('This is a comment!')
  end

  scenario "Username is displayed above the comment" do
    sign_up_and_sign_in
    make_a_text_post
    fill_in "comment_content", with: 'This is a comment!'
    click_button "Comment"
    expect(page).to have_css(".comment-name", text: 'Clint')
  end

  scenario "User can comment on other user's posts" do
    sign_up_and_sign_in
    make_a_text_post
    click_link "Log Out"
    sign_up_and_sign_in_other_user
    fill_in "comment_content", with: 'This is a comment!'
    click_button "Comment"
    expect(page).to have_css(".comment-name", text: 'Louise')
  end
end
