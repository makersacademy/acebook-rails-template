require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts" do
    visit "/posts"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    click_button "Delete Post"
    expect(page).not_to have_content("Hello, world!")
  end
end