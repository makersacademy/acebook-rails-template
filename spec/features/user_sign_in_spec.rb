require 'rails_helper'

RSpec.feature "User Sign In", type: :feature do

  before do
    sign_up("Example1", "email@example.com", "pass12", "pass12")
    click_link("Sign out")
    click_link("Log in")
  end

  context "when signing in with email" do

    scenario "displays a confirmation message when a user signs" do
      fill_in "user_login", with: "email@example.com"
      fill_in "user_password", with: "pass12"
      click_button("Log in")
      expect(page).to have_content("Signed in successfully.")
      expect(page).to have_content("Account: Example1")
    end

    scenario "can sign in when email is in all caps" do
      fill_in "user_login", with: "EMAIL@EXAMPLE.COM"
      fill_in "user_password", with: "pass12"
      click_button("Log in")
      expect(page).to have_content("Signed in successfully.")
      expect(page).to have_content("Account: Example1")
    end

    scenario "displays an error message when the email address is incorrect" do
      fill_in "user_login", with: "email@"
      fill_in "user_password", with: "pass12"
      click_button("Log in")
      expect(page).to have_content("Invalid Login or password.")
      expect(page).to have_current_path('/users/sign_in')
    end

    scenario "displays an error message when the email address is incorrect" do
      fill_in "user_login", with: "email@example.org"
      fill_in "user_password", with: "pass12"
      click_button("Log in")
      expect(page).to have_content("Invalid Login or password.")
      expect(page).to have_current_path('/users/sign_in')
    end

  end

  context "when signing in with username" do

    scenario "displays a confirmation message when a user signs in" do
      fill_in "user_login", with: "Example1"
      fill_in "user_password", with: "pass12"
      click_button("Log in")
      expect(page).to have_content("Signed in successfully.")
      expect(page).to have_content("Account: Example1")
    end

    scenario "can sign in when username is in all caps" do
      fill_in "user_login", with: "EXAMPLE1"
      fill_in "user_password", with: "pass12"
      click_button("Log in")
      expect(page).to have_content("Signed in successfully.")
      expect(page).to have_content("Account: Example1")
    end

    scenario "displays an error message when the username is incorrect" do
      fill_in "user_login", with: "Test2"
      fill_in "user_password", with: "pass12"
      click_button("Log in")
      expect(page).to have_content("Invalid Login or password.")
      expect(page).to have_current_path('/users/sign_in')
    end

  end

  scenario "displays an error message when the password is incorrect" do
    fill_in "user_login", with: "email@example.com"
    fill_in "user_password", with: "pass1245"
    click_button("Log in")
    expect(page).to have_content("Invalid Login or password.")
    expect(page).to have_current_path('/users/sign_in')
  end

end
