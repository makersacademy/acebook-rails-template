require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit comments on posts and view them" do
    signup
    visit "/posts"
    click_on "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")

    click_on "New comment"

    fill_in :comment_text, with: "New comment"
    click_on "Submit"
    
    expect(page).to have_content("New comment")
  end
end
