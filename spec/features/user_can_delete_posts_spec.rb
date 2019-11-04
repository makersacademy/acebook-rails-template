require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Content", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    click_link "Delete"
    expect(page).not_to have_content("Goodbye, world!")
  end
end
