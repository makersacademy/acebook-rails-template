require 'rails_helper'

RSpec.feature "User Profile", type: :feature do

  before(:each) do
    successful_sign_up
    successful_sign_up_second_user
  end

  scenario "A user can view their own posts on their profile" do
    first_user_post
    second_user_post
    click_link "View your profile"
    expect(page).to have_content("Second user post")
    expect(page).not_to have_content("My first post")
  end

  scenario "A user move from profile to homepage" do
    first_user_post
    second_user_post
    click_link "View your profile"
    click_link "Home"
    expect(page).to have_content("My first post")
    expect(page).to have_content("Second user post")
  end

end
