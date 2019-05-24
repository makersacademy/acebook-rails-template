require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can update posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "New", with: "Hello, world!"
    click_button "Submit"
    click_link "Edit"
    expect(page).to have_content("Hello, world!")
    fill_in "Message", with: "Hi, Earth!"
    click_button "Update"
    expect(page).to have_content("Hi, Earth!")
  end
end
