require "rails_helper"

RSpec.feature "Profile picture", type: :feature do
  scenario "user profile has default image" do
    user_sign_up
    submit_test_post
    click_link "Bob"
    puts page.body
    expect(page).to have_css("img[src*='http://www.personalbrandingblog.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640-300x300.png']")
  end
  scenario "user profile picture can be changed" do
    user_sign_up
    submit_test_post
    click_link "Bob"
    puts page.body
    click_link "profile-pic"
    fill_in :user_profilepic, with: "test"
    click_on "Update User"
    expect(page).to have_css("img[src*='test']")
  end

end
