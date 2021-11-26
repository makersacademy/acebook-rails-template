require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "User can write comment on a post" do
    visit "/posts"
    click_link "Write a post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "Comment", with: "Nice comment"
    click_button "Post Comment"
    expect(page).to have_content("Nice comment")
  end
end 
