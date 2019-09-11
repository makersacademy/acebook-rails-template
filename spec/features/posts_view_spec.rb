require 'rails_helper'

RSpec.feature "Post", type: :feature do
  scenario "Posts have a timestamps" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("UTC")
  end
end
