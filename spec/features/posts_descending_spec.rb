require 'rails_helper'

RSpec.feature "Posts in descending order", type: :feature do
  scenario "Posts are displayed in descending order" do
    login_sarah_fewposts
    click_link("New post")
    fill_in "post_message", with: "This post is newer than any subsequent posts, number 7"
    click_on "Submit"
    expect(page.body.index("post-id-6") < page.body.index("post-id-2")).to be(true)
  end
end
