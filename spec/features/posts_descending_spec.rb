require 'rails_helper'

RSpec.feature "Posts in descending order", type: :feature do
  scenario "Posts are displayed in descending order" do
    visit '/'
    click_link("Sign up", match: :first)
    fill_in "user_email", with: "featuretester@email.com"
    fill_in "user_first_name", with: 'feature'
    fill_in "user_last_name", with: 'test'
    fill_in "user_password", with: "featurepwd"
    fill_in 'user_password_confirmation', with: "featurepwd"
    click_on "Submit"
    click_link("New post")
    fill_in "post_message", with: "This post is newer than any subsequent posts, number 7"
    click_on "Submit"
    expect(page.body.index("post-id-6") < page.body.index("post-id-2")).to be(true)
  end
end