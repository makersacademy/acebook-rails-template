require "rails_helper"

RSpec.feature "People can comment on posts", type: :feature do
  scenario "click on comment within post and see the empty comment thread" do
    seed_post
    sign_up
    find_link("Comment").click
    expect(page).to have_content "Hello, giraffe!"
    expect(page).to have_css '.comment-thread'
  end

  scenario "go to a comment thread and post your comment" do
    seed_post
    sign_up
    find_link("Comment").click
    find(:xpath, "//a[@href='/commontator/threads/1']").click
    find_link("Show Comments (0)").click
    find_link("New Comment").click
    fill_in "comment[body]", with: "actually it's zebra"
    find_button("Post Comment").click
    expect(page).to have_content "actually it's zebra"
    expect(page).to have_content "Posted on"
    expect(page).to have_link "New Comment"
  end

  xscenario "see existing non-empty comment thread"

  xscenario "both original post and new comment have date created"
end