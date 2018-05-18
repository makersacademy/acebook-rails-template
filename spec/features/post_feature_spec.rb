require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "logged out users cannot delete posts" do
    signup_and_login
    create_dummy_post
    click_link "username-dropdown"
    click_link "Logout"
    click_link "View Posts"
    expect(page).not_to have_content("Delete")
  end

  scenario "logged out users cannot delete posts" do
    signup_and_login
    create_dummy_post
    click_link "username-dropdown"
    click_link "Logout"
    signup_and_login_alt_user
    click_link "View Posts"
    expect(page).not_to have_content("Delete")
  end
end
