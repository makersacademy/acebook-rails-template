require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "You can sign in" do
    visit "/users/sign_up"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "testtest"
    fill_in "user_password_confirmation", with: "testtest"
    click_button "Sign up"
    click_button "Log out"
    visit "/users/sign_in"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "testtest"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end
end
