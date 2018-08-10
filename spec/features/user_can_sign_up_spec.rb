require 'rails_helper'

RSpec.feature "SignUp", type: :feature do

  scenario "A user can sign up with valid credentials" do
    successful_sign_up
    expect(page).to have_content("Welcome to Acebook!")
    expect(page).to have_content("test_first_name test_last_name")
  end

  scenario "A user provides an password with less than 6 characters" do
    unsuccessful_sign_up_with_wrong_password
    fill_in 'Password', with: "pass"
    click_button "Sign Up"
    expect(page).to have_content("The password needs to be between 6-10 characters.")
  end

  scenario "A user provides an password with more than 10 characters" do
    unsuccessful_sign_up_with_wrong_password
    fill_in 'Password', with: "passWordthatismorethan10Char"
    click_button "Sign Up"
    expect(page).to have_content("The password needs to be between 6-10 characters.")
  end

  scenario "A user does not provide a first name" do
    unsuccessful_sign_up_without_first_name
    expect(page).to have_content("What's your first name.")
  end

  scenario "A user does not provide a last name" do
    unsuccessful_sign_up_without_last_name
    expect(page).to have_content("What's your last name.")
  end

  scenario "A user does not provide an email address" do
    unsuccessful_sign_up_without_email
    expect(page).to have_content("Please enter a valid email address")
  end

  scenario "A user provides an email already taken" do
    successful_sign_up
    click_link 'Log Out'
    successful_sign_up
    expect(page).to have_content("This email address has already been used")
  end

  scenario "A user does not provide a valid email address format" do
    unsuccessful_sign_up_with_wrong_email_format
    expect(page).to have_content("Please enter a valid email address")
  end

end
