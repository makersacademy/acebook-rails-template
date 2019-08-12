require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end
end
