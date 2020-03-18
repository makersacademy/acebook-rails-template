require 'rails_helper'

RSpec.feature "Adding a comment", type: :feature do
  scenario "User creates a post and comments on their own posts" do
    sign_up
    visit('/posts')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    first(:link, "Post Details").click
    fill_in "Comment", with: "Hello, Earth!"
    click_button "Submit"
    
    expect(page).to have_content("Comment posted successfully")
    expect(page).to have_content("Hello, Earth!")
   
  end
  scenario "User creates a post and comments blank on their own post" do
    sign_up
    visit('/posts')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    first(:link, "Post Details").click
    click_button "Submit"
    expect(page).to have_content("Comment ran into an error being posted...")
    expect(page).not_to have_content("Comment posted successfully")
  end
end
