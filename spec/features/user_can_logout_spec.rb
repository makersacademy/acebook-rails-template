require 'rails_helper'
RSpec.feature "logging out", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
    fill_in "First Name", with: "Al"
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Create User"

    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Login"
  end
  scenario "user finds a log out link" do
 
    expect(page).to have_link("Log out")

  end

  scenario "user can log out of their account" do
    click_link "Log out"
    expect(page).to have_current_path("/")
    expect(page).to have_content("Logged out!")
  end
end