require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can update posts they have created" do
    signup
    expect(current_path).to eq("/posts")
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")
    click_on "Edit"
    fill_in "Message", with: "Updated message"
    click_button "Submit"
    expect(page).to have_content("Updated message")
  end
  
  scenario "Cannot update posts they did not create" do
    signup
    expect(current_path).to eq("/posts")
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")
    expect(page).to have_button("Edit")
    click_on "Logout"

    signup_user("Dawid", "Dawid@example.com", "password1")
    expect(current_path).to eq("/posts")
    expect(page).to_not have_content("Edit")
  end
end
