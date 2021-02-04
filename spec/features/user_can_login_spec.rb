require 'rails_helper'

RSpec.feature "Account login", type: :feature do
  scenario "user can login into account" do
    visit "/users"
    click_link "login page"
    fill_in "user[username]", with: "Charlotte"
    fill_in "user[password]", with: "this_is_a_password"
    click_button "Submit"
    expect(page).to have_content("You have logged in!")
  end

  scenario "invalid login" do
    visit "/users"
    click_link "login page"
    fill_in "user[username]", with: "Charlotte"
    fill_in "user[password]", with: "wrong-password"
    click_button "Submit"
    expect(page).to have_content("Incorrect username or password")
  end
end

