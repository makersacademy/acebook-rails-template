require 'rails_helper'

RSpec.feature "Deleting", type: :feature do
  scenario "Can delete posts" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    binding.pry
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
    expect(page).to have_current_path("/posts")
  end
end
