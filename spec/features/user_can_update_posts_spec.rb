require "rails_helper"
require "web_helper"

RSpec.feature "Update Posts", type: :feature do
  scenario "user can update post" do
    user_sign_up
    submit_test_post
    visit("/posts")
    click_link "test post"
    click_link "Edit"
    fill_in :post_content, with: "edited post"
    click_on "Update Post"
    expect(page).to have_content("edited post")
  end
end
