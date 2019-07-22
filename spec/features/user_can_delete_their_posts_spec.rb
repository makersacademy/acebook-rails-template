require 'rails_helper'
require 'seed_post_helper'

RSpec.feature "Users can delete their own posts", type: :feature do
  scenario "delete option appears on own post by signed in user" do
    seed_post
    sign_up
    visit "/posts"
    expect(page).not_to have_content("Delete")
    click_link "New post"
    fill_in "Message", with: "This is a message that can be removed"
    click_button "Submit"
    expect(page).to have_content("Delete")
  end
end
