require 'rails_helper'
RSpec.feature "logging out", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "123456"
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