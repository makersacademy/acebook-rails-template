require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts, shows times and dates" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world! first post"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Hello, world! second post"
    click_button "Submit"
    expect(page).to have_selector("ul#wall li:nth-child(1)", text: "second post")
    expect(page).to have_selector("ul#wall li:nth-child(2)", text: "first post")

  end
end
