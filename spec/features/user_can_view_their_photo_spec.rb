require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Users can see their profile picture after making a post" do
    user_sign_up

    fill_in "post_message", with: "Hello, world!"
    click_button "Post"

    expect(page).to have_css("img[src*='capybara.jpg']")
  end
end
