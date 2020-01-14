require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do
  scenario "displays a confirmation message when a user signs up" do
    visit "/users/sign_up"
    fill_in "user_email", with: "email@test.com"
    fill_in "user_password", with: "pass1234"
    fill_in "user_password_confirmation", with: "pass1234"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
