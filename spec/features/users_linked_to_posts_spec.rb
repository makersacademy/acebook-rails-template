require 'rails_helper'

RSpec.feature "User linked to posts", type: :feature do
  scenario "John sees his name beside his message" do
    user_sign_up

    fill_in "post_message", with: "Hello, world!"
    click_button "Post"

    expect(page).to have_content "John - Hello, world!"
  end
end
