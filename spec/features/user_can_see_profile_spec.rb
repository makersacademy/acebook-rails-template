require 'rails_helper'

RSpec.feature "Profile", type: :feature do
  scenario "Can see username and posts" do
    visit "/timeline"
    click_on("@Charlotte")
    expect(page).to have_content("Charlotte")
    expect(page).to have_content("Hello World")
  end
end

RSpec.feature "Only add posts from your profile", type: :feature do
  scenario "Can add posts from logged in profile" do
    visit "/users/1"
    expect(page).to have_css("#post_content")
  end

  scenario "Can't add posts from someone else's profile" do
    visit "/"
    within_fieldset :sign_up do
      fill_in "user_username", with: "Lotty"
      fill_in "user_password", with: "Password12"
      click_button "Sign Up"
    end
    # sign up as another user
    within_fieldset :log_in do
      fill_in "username", with: "Lotty"
      fill_in "password", with: "Password12"
      click_button "Log In"
    end
    # sign in as other user
    visit "/users/1" #-> Charlotte's page
    expect(page).not_to have_css("#post_content")
  end
end