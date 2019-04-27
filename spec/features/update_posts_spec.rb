require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Update posts", type: :feature do
  scenario "user can update an existing post" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "This message is going to be updated!"
    click_button "Submit"
    click_link "Update"
    fill_in "Message", with: "This message has been updated!"
    click_button "Update"
    expect(page).to have_content "This message has been updated!"
  end

  scenario "user cannot update other user's post" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "User 1 message"
    click_button "Submit"
    click_button "Sign out"
    create_second_user_and_sign_in
    expect(page).to have_no_link "Update"
  end
end