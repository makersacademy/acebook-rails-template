require 'rails_helper'

RSpec.feature "Edit", type: :feature do
  scenario "A User can update their own post" do
    visit "/users/sign_up"
    fill_in "user_email", with: "jakc@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
    fill_in "post_username", with: "Jack Test"
    fill_in "post_message", with: "Have you seen Gill?"
    click_button "Submit"
    find('#post_1').click
    area = find("#post_1")
    save_and_open_page
    area.native.send_keys("(Changed) Lorem ipsum.")
    expect(page).to_not have_content("Have you seen Gill?")
  end
end
