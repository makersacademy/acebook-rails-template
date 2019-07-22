
require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "can let a user sign up" do
    visit "/"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "password1"
    fill_in "user_password_confirmation", with: "password1"
    click_button "Create User"
    expect(page).to have_content("User was successfully created.")
  end

  scenario "can raise an error if minimum password" do
    visit "/"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "passw"
    fill_in "user_password_confirmation", with: "passw"
    click_button "Create User"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "can raise an error if passwords don't match" do
    visit "/"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "notpassword"
    click_button "Create User"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "can raise an error if email has been taken" do
    visit "/"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "password1"
    fill_in "user_password_confirmation", with: "password1"
    click_button "Create User"
    expect(page).to have_content("User was successfully created.")

    visit "/"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "password1"
    fill_in "user_password_confirmation", with: "password1"
    click_button "Create User"
    expect(page).to have_content("Email has already been taken")
  end
end
