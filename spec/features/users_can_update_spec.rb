require 'rails_helper'

RSpec.feature "Update", type: :feature do
  scenario "Can update posts" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_link "Update"
    fill_in "Message", with: "Hello, world changed!"
    click_button "Update"
    expect(page).to have_content("Hello, world changed!")
  end
end