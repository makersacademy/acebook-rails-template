require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can update posts and view them if you are the author" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Edit")
    click_link "Edit"
    fill_in "Content", with: "Goodbye, world!"
    click_button "Submit"
    expect(page).to have_content("Goodbye, world!")
  end

  scenario "Cannot update posts and view them if you are not the author" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Edit")
    click_link "LogOut"
    signup_as_new_user("James")
    login_as_user("James")
    expect(page).to have_content("Hello, world!")
    expect(page).not_to have_content("Edit")
  end
end
