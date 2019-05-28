require 'rails_helper'

RSpec.feature "Create an account", type: :feature do

  before(:each) do
    visit("/users/sign_up")
  end

  scenario "Can see 'Create an account' form" do
    expect(page).to have_content("Create an account")
  end

  scenario "Can fill out 'Create an account' form" do
    fill_in "Username", with: "testName"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "testPassword"
    fill_in "Password confirmation", with: "testPassword"
    click_button "Create an account"
    expect(page).to have_content("You have signed up successfully")
  end

  scenario "'Create an account' form throws error if password is shorter than 6 characters" do
    fill_in "Username", with: "testName"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_button "Create an account"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "'Create an account' form throws error if email has already been taken" do
    fill_in "Username", with: "testName"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "testPassword"
    fill_in "Password confirmation", with: "testPassword"
    click_button "Create an account"
    expect(page).to have_content("You have signed up successfully")

    click_link "Logout"
    click_link "Sign up"

    fill_in "Username", with: "testName"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "testPassword"
    fill_in "Password confirmation", with: "testPassword"
    click_button "Create an account"
    expect(page).to have_content("Email has already been taken")
  end
end
