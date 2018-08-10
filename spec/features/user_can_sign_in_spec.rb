require 'rails_helper'

RSpec.feature "Session/ Sign-in", type: :feature do

  before(:each) do
    successful_sign_up
    click_link 'Log Out'
  end

  scenario "A user can sign in with valid credentials" do
    successful_sign_in
    expect(page).to have_content("Welcome back to Acebook!")
    expect(page).to have_content("test_first_name test_last_name")
  end

  scenario "A user signs in with invalid email address" do
    unsuccessful_sign_in_with_wrong_email
    expect(page).to have_content("The email address that you've entered doesn't match an account.")
  end

  scenario "A user signs in with incorrect password" do
    unsuccessful_sign_in_with_wrong_password
    expect(page).to have_content("The password that you've entered is incorrect.")
  end

  scenario "A user can go to sign up page" do
    path_to_the_sign_in
    click_link("Sign up for Acebook")
    expect(page).to have_content("First name")
  end
end
