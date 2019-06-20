require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "Views posts in reverse chronological  order" do
    sign_up(email: "test@test.com", password: "password")
    visit "/posts/new"
    fill_in "Message", with: "Post number one"
    click_button "Submit"

    visit "/posts/new"
    fill_in "Message", with: "This is the second post"
    click_button "Submit"

    first(:button, "Delete").click
    expect(page).to have_content("Post number one")
    expect(page).not_to have_content("This is the second post")
  end
end