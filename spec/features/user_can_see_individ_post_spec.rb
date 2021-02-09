require 'rails_helper'

RSpec.feature "Individual Post page", type: :feature do
  before do
    visit "/posts/1"
  end

  scenario "Can see individual posts" do
    expect(page).to have_content("Hello World")
    expect(page).to have_content("@Charlotte")
  end

  scenario "Like post" do
    expect(page).to have_content("0 likes")
    click_on "Like"
    expect(page).to have_content("1 like")
  end

  scenario  "See comments" do
    expect(page).to have_content("This is a great post!")
  end

  scenario  "Add comment" do
    click_on "Add Comment"
    fill_in "comment_content", with: "This is a new comment"
    find("#submit_comment").click
    expect(page).to have_content("This is a new comment")
  end

  scenario  "Add comment" do
    click_on "Share"
    fill_in "post_content", with: "This is a new share"
    find("#submit_share").click
    expect(page).to have_content("Posted!")
    # visit "/posts/2"
    # expect(page).to have_content("Hello World")
    # expect(page).to have_content("This is a new share")
  end
end
