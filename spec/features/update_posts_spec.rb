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
end

RSpec.feature "Timeline", type: :feature do
  scenario "Cannot update posts they did not create" do
    signup
    expect(current_path).to eq("/posts")
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")

    visit "/signup"
    fill_in "Name", with: "Dawid"
    fill_in "Email", with: "dawid@gmail.com"
    fill_in "Password", with: "password123"
    fill_in "Confirm Password", with: "password123"
    click_button "Sign up"

    expect(current_path).to eq("/posts")
    expect(page).to_not have_content("Edit")
  end
end
