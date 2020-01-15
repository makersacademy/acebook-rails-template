require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "Can log in as a user" do
    visit "/signup"
    fill_in "Name", with: "Ben"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "1234"
    fill_in "Confirm Password", with: "1234"
    click_button "Sign up"
    visit "/login"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "1234"
    click_button "Log in"
    expect(page).to have_content("New post")
  end
end