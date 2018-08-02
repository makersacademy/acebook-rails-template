require 'rails_helper'

RSpec.feature "Profile", type: :feature do

  before(:each) do
    successful_sign_up
    successful_sign_up_second_user
  end

  scenario "A user can add a post to their own homepage" do
    successful_log_in
    fill_in :post, with: "My first post"
    click_button "Post"
    successful_log_in_second_user
    fill_in :post, with: "Second user post"
    click_button "Post"
    click_button "My Profile"
    expect(page).to have_content("Second user post")
    expect(page).not_to have_content("My first post")
  end

end
