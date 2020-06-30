require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Update post"
    fill_in "Update message", with: "I'm updated"
    expect(page).to have_content("I'm updated")
    expect(page).not_to have_content("Hello, world!")
  end
end
