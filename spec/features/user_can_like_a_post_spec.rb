require 'rails_helper'

RSpec.feature "Like", type: :feature do
  scenario "User can like a post once" do
    sign_up_and_login
    click_link "New post"
    fill_in "New", with: "Hello, world!"
    click_button "Post"
    click_button "Like"
    expect(page).to have_content("1 Like")
  end

  scenario "User can unlike a post they have liked" do
    sign_up_and_login
    click_link "New post"
    fill_in "New", with: "Hello, world!"
    click_button "Post"
    click_button "Like"
    click_button "Unlike"
    expect(page).not_to have_content("1 Like")
    expect(page).to have_content("0 Likes")
  end
end
