# user successfully updated if new passwords match

require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "can let a user log in" do
    visit "/"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "password1"
    fill_in "user_password_confirmation", with: "password1"
    click_button "Create User"
    expect(page).to have_content("User was successfully created.")

    visit "/login"
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "password1"
    click_button "login"
    expect(page).to redirect_to("/posts")
  end

  scenario "can raise an error if login details are incorrect" do
    visit "/"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "password1"
    fill_in "user_password_confirmation", with: "password1"
    click_button "Create User"
    expect(page).to have_content("User was successfully created.")

    visit "/login"
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "password420"
    click_button "login"
    expect(page).to have_content("Email or password is invalid")
  end

  # scenario "can let a existing user edit details" do
  #   visit "/"
  #   fill_in "user_email", with: "email@email.com"
  #   fill_in "user_password", with: "password1"
  #   fill_in "user_password_confirmation", with: "password1"
  #   click_button "Create User"
  #   expect(page).to have_content("User was successfully created.")
  #
  #   click_link "Edit"
  #   fill_in "user_email", with: "email@email.com"
  #   fill_in "user_password", with: "password1"
  #   fill_in "user_password_confirmation", with: "password1"
  #   click_button "Create User"
  #   expect(page).to have_content("User was successfully created.")
  #
  # end

end
