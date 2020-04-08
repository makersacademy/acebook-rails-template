require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "You can sign up" do
    visit "/users/sign_up"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "testtest"
    fill_in "user_password_confirmation", with: "testtest"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
