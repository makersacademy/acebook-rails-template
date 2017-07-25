require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Can submit a comment" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "comment-text", with: "I'm a comment"
    click_button "Comment"
    expect(page).to have_content("I'm a comment")
  end
end
