require 'rails_helper'

RSpec.feature "Update", type: :feature do
  scenario "Can update posts they have created" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")
    click_on "Edit"
    fill_in "Message", with: "Updated message"
    click_button "Submit"
    expect(page).to have_content("Updated message")
  end
end
