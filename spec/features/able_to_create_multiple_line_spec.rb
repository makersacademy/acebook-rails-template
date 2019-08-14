require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts with multiple lines and they'll be displayed", js: true do
    visit "/posts"
    click_link "New post"
    input = find_field 'Message'
    input.native.send_keys("Hello, world!", :return, "Second line", :return, "Third line")
    click_button "Submit"
    expect(page).to have_selector("ul#wall li:nth-child(1)", text:
    "Hello, world!
    Second line
    Third line")
  end
end
