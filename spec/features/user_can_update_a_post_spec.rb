require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts" do
    visit "/posts"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    click_button "Edit"
    fill_in "Message", with: "Goodbye, world!"
    click_button "Submit"
    expect(page).to have_content("Goodbye, world!")
  end
end