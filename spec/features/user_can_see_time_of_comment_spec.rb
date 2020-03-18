require 'rails_helper'

RSpec.feature "Viewing Comment Details", type: :feature do
  scenario "User adds a comment and sees the time it was posted at" do
    sign_up
    visit('/posts')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    first(:link, "Post Details").click
    fill_in "Comment", with: "Hello, Earth!"
    click_button "Submit"
    comment = Comment.last
    expect(page).to have_content("Comment posted successfully")
    expect(page).to have_content("Hello, Earth!")
    expect(page).to have_content("#{comment.created_at}")
  end
end
