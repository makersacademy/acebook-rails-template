require 'rails_helper'

RSpec.feature "Create an account", type: :feature do

  before(:each) do
    visit("/users/sign_up")
  end

  scenario "shows a 'Create an account' form" do
    expect(page).to have_content("Create an account")
  end

  scenario "form throws error if email has already been taken" do
    create_user_test_email_dot_com_1234567
    click_link "Logout"
    click_link "Sign up"
    create_user_test_email_dot_com_1234567
    expect(page).to have_content("Email has already been taken")
  
  end

  xscenario "displays the required password length" do
    expect(page).to have_content("6-10 characters")
  end

  scenario "form throws error if password is shorter than 6 characters" do
    fill_in "Username", with: "testName"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "123"
    fill_in "Confirm password", with: "123"
    click_button "Create an account"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "form throws error if password is longer than 10 characters" do
    fill_in "Username", with: "testName"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "12345678911"
    fill_in "Confirm Password", with: "12345678911"
    click_button "Create an account"
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end

  scenario "form can be correctly filled out" do
    create_user_test_email_dot_com_1234567
    expect(page).to have_content("You have signed up successfully")
  end
end
