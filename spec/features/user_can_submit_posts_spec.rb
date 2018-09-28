require "rails_helper"
require "web_helper"

RSpec.feature "New Posts", type: :feature do
  scenario "user can post message" do
    user_sign_up
    submit_test_post
    expect(page).to have_content("test post")
  end

  scenario "user can't post and is redirected to home if not logged in" do
    visit "/posts/new"
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Log in")
  end
end
