require "rails_helper"

RSpec.feature "Deleting Posts", type: :feature do
  scenario "Delete posts link exists" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, this is message 1"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Howdy, I'm message 2"
    click_button "Submit"
    expect(page).to have_selector(:link_or_button, "Delete")
  end

  scenario "Deleting posts removes them from the feed" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, this is message 1"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Howdy, I'm message 2"
    click_button "Submit"
    click_link("Delete", match: :first)
    expect(page).to have_content("Hello, this is message 1")
    expect(page).not_to have_content("Howdy, I'm message 2")
  end
end
