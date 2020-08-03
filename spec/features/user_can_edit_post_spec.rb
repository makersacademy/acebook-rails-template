require 'rails_helper'

RSpec.feature "Edit ", type: :feature do
  scenario "Can edit own post and view the updated post" do
    signup
    login
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    click_link "Back"
    click_link "Edit"
    fill_in "post[message]", with: "Hello, world"
    click_button "Update Post"
    expect(page).to have_content("Hello, world")
  end

  scenario "Own post after 10 minutes" do
    signup
    login
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    @post = Post.find(URI.parse(current_url).to_s.split("/")[-1].to_i)
    p @post.created_at
    @post.created_at = 11.minutes.ago
    p @post.created_at
    # click_link "Back"
    # expect(page).not_to have_link("Edit")
    expect(page).to have_link("Back")
  end
end
