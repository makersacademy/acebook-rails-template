require 'rails_helper'

RSpec.feature "Empty posts", type: :feature do
  scenario "User cannot post an empty post" do
    user_sign_up

    fill_in "post_message", with: nil
    click_button "Post"

    expect(page).to have_content("Invalid post")
  end
end
