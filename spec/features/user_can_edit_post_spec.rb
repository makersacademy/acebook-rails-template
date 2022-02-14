require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and edit them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_link "View post"
    click_link "Edit post"
    fill_in "Message", with: "Hello, there!"
    click_button "Update Post"

    expect(page).to have_content("Hello, there!")
  end
end
