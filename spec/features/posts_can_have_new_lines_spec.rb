require 'rails_helper'

RSpec.feature "Posts with newlines", type: :feature do
  scenario "User creates a multi line post" do
    user_sign_up

    fill_in "post_message", with: "Hello, world!\rWaddup"
    click_button "Post"

    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Waddup")
  end
end
