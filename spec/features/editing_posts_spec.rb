require 'rails_helper'

RSpec.feature "Editing posts", type: :feature do
  scenario "User can edit posts and see result on /posts" do
    user_signup('arakno', 'arakno@makers.com')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    post_id = Post.find_by(message: "Hello, world!").id
    within("div#post-#{post_id}") do
      click_link "edit"
    end
    fill_in "Message", with: "New message"
    click_button "Submit"
    expect(page).to have_content("New message")
  end

  scenario "User cannot see edit button on someone else's post" do
    user_signup('arakno', 'arakno@makers.com')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Logout"
    user_signup('ds.danielh', 'dan@makers.com')
    expect(page).not_to have_link("edit")
  end

  scenario "User receives an error message if they try to edit someone else's post" do
    user_signup('arakno', 'arakno@makers.com')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Logout"
    user_signup('ds.danielh', 'dan@makers.com')
    post_id = Post.find_by(message: "Hello, world!").id
    visit "/posts/#{post_id}/edit"
    fill_in "Message", with: "New message"
    click_button "Submit"
    expect(page).to have_content("Error: You can only edit your own posts.")
  end
end