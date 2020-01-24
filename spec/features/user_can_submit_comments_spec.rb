require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "Can submit comments on posts and view them" do
    signup
    visit "/posts"
    click_on "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")

    click_on "Comments"

    fill_in :comment_text, with: "My comment"
    click_on "Add"

    expect(page).to have_content("My comment")
  end
end
