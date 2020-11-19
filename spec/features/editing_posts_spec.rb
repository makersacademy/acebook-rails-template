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
end