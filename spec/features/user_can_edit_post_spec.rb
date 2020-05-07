require 'rails_helper'

RSpec.feature "Edit Post", type: :feature do
  scenario "user can edit existing post" do
    post = Post.create!(message: "Hello World!")
    visit "/posts"
    click_button "Edit post"
    fill_in "post[message]", with: "I'm a new message"
    click_button "Update Post"
    expect(page).to have_content("I'm a new message")
    expect(page).not_to have_content("Hello World!")
  end
end