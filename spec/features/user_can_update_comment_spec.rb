require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can update comment" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
    fill_in "comment[text]", with: "Great post!"
    click_button "Save Comment"
    expect(page).to have_content("Great post!")
    # expect(page).to have_content("Edit comment")
    click_link "Edit comment"
    fill_in "comment[text]", with: "Great post again!"
    click_button "Update Comment"
    expect(page).to have_content("Great post again!")
  end
end
