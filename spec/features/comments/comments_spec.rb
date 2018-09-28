require "rails_helper"
require "web_helper"

RSpec.feature "Comments can be made on posts", type: :feature do
  before(:each) do
    user_sign_up
    submit_test_post
  end

  scenario "Post is not commented on initially" do
    expect(page).not_to have_content("Bob: ")
  end

  scenario "Comment made on post is visible" do
    add_comment("This is a comment")
    expect(page).to have_content("Bob: This is a comment")
  end

  scenario "Comments can be made on a single post by multiple people" do
    add_comment("This is a comment")
    click_on "Sign out"
    user_sign_up("Jim")
    click_on "test post"
    add_comment("This is Jim's comment")
    expect(page).to have_content("Bob: This is a comment")
    expect(page).to have_content("Jim: This is Jim's comment")
  end

  scenario "Comments are visible on timeline page" do
    visit root_path
    add_comment("This is a comment")
    expect(page).to have_content("Bob: This is a comment")
  end
end
