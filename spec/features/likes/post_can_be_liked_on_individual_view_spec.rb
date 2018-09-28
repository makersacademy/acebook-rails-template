require "rails_helper"
require "web_helper"

RSpec.feature "Post can be liked on individual comment page", type: :feature do
  before(:each) do
    user_sign_up
    submit_test_post
  end

  scenario "Post is not liked before button clicked" do
    expect(page).not_to have_content("Liked by: Bob")
  end

  scenario "Post can be liked, which is visible" do
    click_on "Like"
    expect(page).to have_content("Liked by: Bob")
  end

  scenario "Post can be liked by multiple people" do
    click_on "Like"
    click_on "Sign out"
    user_sign_up("Jim")
    click_on "Like"
    expect(page).to have_content("Liked by: Jim, Bob")
  end
end
