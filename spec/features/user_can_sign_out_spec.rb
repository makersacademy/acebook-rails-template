require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can sign out and log in stupid" do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "Email", with: "emailstupid@duh.com!"
    fill_in "Password", with: "notapassword"
    fill_in "Password confirmation", with: "notapassword"
    click_button "Sign up"
    click_link "Logout"
    fill_in "Email", with: "emailstupid@duh.com!"
    fill_in "Password", with: "notapassword"
    click_button "Log in"
    expect(page).to have_content("Logged in as emailstupid@duh.com")
  end
end