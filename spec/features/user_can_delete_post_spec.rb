require 'rails_helper'

RSpec.feature "User can delete a post", type: :feature do
  scenario "User creates and delete the post" do
    user_sign_up

    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"

    click_link "DELETE"
    expect(page).not_to have_content("Hello, world!")
  end
end
