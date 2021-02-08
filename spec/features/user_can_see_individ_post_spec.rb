require 'rails_helper'

RSpec.feature "Individual Post page", type: :feature do
  scenario "Can see individual posts" do
    visit "/posts/1"
    expect(page).to have_content("Hello World")
    expect(page).to have_content("@Charlotte")
  end

  scenario "Like post" do
    visit "/posts/1"
    expect(page).to have_content("0 likes")
    click_on "Like"
    expect(page).to have_content("1 like")
  end

  scenario  "See comments" do
    visit "/posts/1"
    expect(page).to have_content("This is a great post!")
  end

  scenario  "Add comment" do
    visit "/posts/1"
    click_on "Add Comment"
    fill_in "comment_content", with: "This is a new comment"
    click_button "Submit"
    expect(page).to have_content("This is a new comment")
  end
end
