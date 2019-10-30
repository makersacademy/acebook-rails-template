require 'rails_helper'

RSpec.feature "Signing up", type: :feature do
  scenario "- can sign in" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "sarah@test.com"
    fill_in "Password", with: "qwerty"
    fill_in "Password confirmation", with: "qwerty"
    click_button "Sign up"
    click_link "Log Out"

    visit "/"
    fill_in "Email", with: "sarah@test.com"
    fill_in "Password", with: "qwerty"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end
end
