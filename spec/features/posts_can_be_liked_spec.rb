require 'rails_helper'

RSpec.feature "Liking posts", type: :feature do
  scenario "posts start off with 0 likes" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content "Likes: 0"
  end

  scenario "posts start off with 0 likes" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button "Like"
    expect(page).to have_content "Likes: 1"
  end
end