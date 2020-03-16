require 'rails_helper'

RSpec.feature "Post Managment", type: :feature do
  scenario "Can update posts" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq "/posts"
    first(".post").click_on "Update"
    fill_in "Message", with: "This is a different message"
    click_button "Submit"
    expect(page).to have_content "This is a different message"
    expect(page).not_to have_content "Hello, world!"
  end
end
