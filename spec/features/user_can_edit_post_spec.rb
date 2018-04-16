require 'rails_helper'

RSpec.feature "timeline", type: :feature do
  scenario "User is able to edit a post" do
    user_sign_up

    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"

    click_link 'EDIT'
    save_and_open_page
    fill_in "post_message", with: "Edited message!"
    click_button "Save"

    expect(page).to have_content "Edited message!"
  end
end
