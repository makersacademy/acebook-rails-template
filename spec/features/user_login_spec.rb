require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "User can login" do
    visit "/welcome"
    click_button "Sign Up"
    fill_in "Username", with: "jooomin"
    fill_in "Password", with: "123"
    click_button "Create User"
    click_button "Login"
    fill_in "Username", with: "jooomin"
    fill_in "Password", with: "123"
    click_button "Login"
    expect(page).to have_content("Welcome You are Logged In, jooomin")
  end
end
