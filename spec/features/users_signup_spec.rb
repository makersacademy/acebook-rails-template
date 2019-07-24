
require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "will let a user sign up" do
    sign_up
    expect(page).to have_content("User was successfully created.")
  end

  scenario "will raise an error if password is too short" do
    short_password
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "will raise an error if passwords don't match" do
    password_match
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "will raise an error if email has been taken" do
    sign_up
    expect(page).to have_content("User was successfully created.")

    sign_up
    expect(page).to have_content("Email has already been taken")
  end
end
