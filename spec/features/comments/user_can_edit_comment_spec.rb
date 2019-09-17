require "rails_helper"

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit posts and view them" do
    sign_in
    visit "/posts"
    click_button "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "comment[body]", with: "This is a comment"
    click_button "Create Comment"
    click_button "Edit Comment"
    fill_in "comment[body]", with: "This is the second comment"
    click_button "Update Comment"
    expect(page).to have_content("This is the second comment")
  end
end
