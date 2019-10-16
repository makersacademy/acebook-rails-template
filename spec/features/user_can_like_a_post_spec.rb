require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can 'like' a post they haven't yet 'liked'" do
    register
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    visit "/posts"
    expect(page).to have_content("0")
    click_link "Like"
    expect(page).to have_content("1")
    expect(page).not_to have_content("0")
  end
end