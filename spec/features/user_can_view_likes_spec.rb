require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view posts reverse chronological order" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First Post"
    click_button "Submit"
    expect(page).to have_content "Number of Likes: 0"
  end

  scenario "Can view posts reverse chronological order" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First Post"
    click_button "Submit"
    click_button "Like"
    expect(page).to have_content "Number of Likes: 1"
  end
end
