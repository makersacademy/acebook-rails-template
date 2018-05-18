require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "User can like posts" do
    signup_and_login
    create_dummy_post
    click_link "Like"
    expect(page).to have_content("Unlike")
  end
  scenario "Number of likes showed below the post" do
    signup_and_login
    create_dummy_post
    click_link "Like"
    visit '/'
    click_link "username-dropdown"
    click_link "Logout"
    signup_and_login_alt_user
    click_link "View Posts"
    click_link "Like"
    expect(page).to have_content("2 people like this")
  end
  scenario "User can unlike post" do
    signup_and_login
    create_dummy_post
    click_link "Like"
    visit '/'
    click_link "View Posts"
    click_link "Unlike"
    expect(page).to have_content("Like")
    expect(page).not_to have_content("1 person likes this")
  end
end
