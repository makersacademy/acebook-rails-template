require 'rails_helper'

RSpec.feature "User Profile", type: :feature do

  before(:each) do
    successful_sign_up
    click_link 'Log Out'
    successful_sign_up_second_user
    click_link 'Log Out'
  end

  scenario "A user can view their own posts on their profile" do
    first_user_post
    click_link 'Log Out'
    second_user_post
    first(:link, "test_first_name2").click
    expect(page).to have_content("Second user post")
    expect(page).not_to have_content("My first post")
  end

  scenario "A user moves from profile to homepage" do
    first_user_post
    click_link 'Log Out'
    second_user_post
    click_link "test_first_name"
    click_link "Home"
    expect(page).to have_content("My first post")
    expect(page).to have_content("Second user post")
  end

end
