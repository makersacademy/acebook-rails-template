require 'rails_helper'

RSpec.feature "User linked to posts", type: :feature do
  scenario "John sees his name beside his message" do
    user_sign_up
    click_link "New post"
    fill_in "Message", with: "Wagwan"
    click_button "Submit"
    expect(page).to have_content "John - Wagwan"
  end
end
