require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  scenario "User can logout" do
    visit "/welcome"
    click_button "Sign Up"
    fill_in "Username", with: "jooomin"
    fill_in "Password", with: "123"
    click_button "Create User"
    click_button "Login"
    fill_in "Username", with: "jooomin"
    fill_in "Password", with: "123"
    click_button "Login"
    click_button "Logout"
    expect(page).to have_content("Welcome")
  end
end