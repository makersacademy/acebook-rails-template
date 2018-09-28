require "rails_helper"

RSpec.feature "Profile picture", type: :feature do
  scenario "user profile has default image" do
    user_sign_up
    submit_test_post
    click_link "Bob"
    expect(page).to have_css("img[src*='https://bit.ly/2Om0jGs']")
  end
  scenario "user profile picture can be changed" do
    user_sign_up
    submit_test_post
    click_link "Bob"
    click_link "profile-pic"
    fill_in :user_profilepic, with: "test"
    click_on "Update User"
    expect(page).to have_css("img[src*='test']")
  end
end
