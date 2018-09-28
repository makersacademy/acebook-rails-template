require "rails_helper"

RSpec.feature "Profile picture", type: :feature do
  scenario "user profile has default image" do
    user_sign_up
    submit_test_post
    click_link "bob@bob.com"
    expect(page).to have_css("img[src*='https://t4.ftcdn.net/jpg/02/15/84/43/240_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg']")
  end
  scenario "user profile picture can be changed" do
    user_sign_up
    submit_test_post
    click_link "bob@bob.com"
    click_link "profile-pic"
    fill_in :user_profilepic, with: "test"
    click_on "Update User"
    expect(page).to have_css("img[src*='test']")
  end

end
