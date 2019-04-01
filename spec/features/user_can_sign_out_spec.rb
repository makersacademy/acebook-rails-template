require 'rails_helper'

RSpec.feature "Sign out and log in", type: :feature do
  scenario "Can sign out and log in" do
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
    expect(page).to have_content("Logout")
  end
end
