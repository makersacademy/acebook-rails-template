require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit a previously posted message" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    click_link "Edit"
    fill_in "post_message", with: "What's up world?"
    click_button "Submit"
    expect(page).to have_content("What's up world?")
    expect(current_path).to eq("/posts")
  end
end
