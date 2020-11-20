require 'rails_helper'

RSpec.feature "Liking posts", type: :feature do
  scenario "user can like posts" do
    add_new_user
    visit '/sessions/new'
    fill_in "email", with: "test@testing.com"
    fill_in "password", with: "test1234"
    click_button("Log In")
    click_link("New post")
    fill_in "message", with: "Best post ever"
    click_on("Submit")
    click_on("like")
    expect(page).to have_content("Likes: 1")
  end
end

