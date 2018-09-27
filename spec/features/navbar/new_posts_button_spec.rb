require "rails_helper"
require "web_helper"

RSpec.feature "Nav bar new posts button", type: :feature do
  scenario "User can click to move to new post page" do
    user_sign_up
    click_link "New post"
    fill_in :post_content, with: "test me post"
    click_on "Create Post"
    expect(page).to have_content("test me post")
  end
end

RSpec.feature "Nav bar not to have new posts button", type: :feature do
  scenario "User not signed in" do
    visit "/"
    expect(page).not_to have_content("New post")
  end
end
