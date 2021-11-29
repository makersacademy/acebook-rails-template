require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "User can comment on a post" do
    visit "/posts"
    click_link "Write a post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link 'Comment'
    fill_in "Comment", with: "Nice one!"
    click_button "Submit comment"
    expect(page).to have_content("Nice one!")
  end
end