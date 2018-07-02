require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Posts appear in reverse order" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First post"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Second post"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Third post"
    click_button "Submit"
    expect(page).to have_selector("ul li:nth-child(1)", text: "Third post")
    expect(page).to have_selector("ul li:nth-child(3)", text: "First post")
  end
end
