require 'rails_helper'

RSpec.feature "User can delete a post", type: :feature do
  scenario "User creates and delete the post" do
    user_sign_up
    click_link "New post"
    fill_in "Message", with: "I create a post"
    click_button "Submit"
    click_link "DELETE"
    expect(page).not_to have_content("I create a post")
  end
end
