require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User creates and delete a post" do
    user_sign_up

    fill_in "post-message", with: "Hello, world!"
    click_button "Post"

    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end
end
