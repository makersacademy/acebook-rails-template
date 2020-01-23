require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit comments on posts and view them" do
    signup
    visit "/posts"
    click_on "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(current_path).to eq("/posts")

    click_on "Comments"
    fill_in :comment_text, with: "My comment"
    click_on "Submit"
    expect(page).to have_content("My comment")
    
    visit('/posts')

    click_on "Comments"
    click_on "edit_comment"
    sleep(5)
    fill_in :comment_text, with: "Edited comment"
    click_on "Submit"

    expect(page).to have_content("My comment")
  end
end