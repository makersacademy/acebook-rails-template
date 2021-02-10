require 'rails_helper'

RSpec.feature "Friends System", type: :feature do
  before do
    visit "/"
    within_fieldset :sign_up do
      fill_in "user_username", with: "Lotty"
      fill_in "user_password", with: "Password12"
      click_button "Sign Up"
    end
    within_fieldset :log_in do
      fill_in "username", with: "Lotty"
      fill_in "password", with: "Password12"
      click_button "Log In"
    end
    # create new user and sign in
  end

  scenario "Add friend" do
    visit "/users/1"
    click_on "Send Friend Request"
    expect(page).to have_button("Delete Friend Request")
  end

  scenario "Accept friend request" do
    visit "/users/1"
    click_on "Send Friend Request"
    visit "/users/log_out"
    visit "/notifications" #switched to user 1
    expect(page).not_to have_content("@Lotty")
    click_on "Accept Friend Request"
    expect(page).to have_content("Accepted friend request!")
    expect(page).not_to have_content("@Lotty")
  end
end

