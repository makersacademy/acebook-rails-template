require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Users can edit their profile picture" do
    user_sign_up

    fill_in "post-message", with: "Hello world!"
    click_button "Post"

    click_link "navbar-edit-avatar"
    fill_in "Current password", with: "password"
    attach_file('user_avatar', Rails.root + "app/assets/images/default.png")
    click_button "Update"

    expect(page).to have_css("img[src*='default.png']")
  end
end
