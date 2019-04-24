require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can see date and time posts submitted" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    created_at = Post.all[0].created_at
    expect(page).to have_content(created_at)
  end
end
