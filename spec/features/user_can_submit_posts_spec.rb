require 'rails_helper'

TIMESTAMP = Time.now
FORMATTED_TIME = TIMESTAMP.strftime("%d %b %Y %k:%M")

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Added at #{FORMATTED_TIME}")
  end
end
