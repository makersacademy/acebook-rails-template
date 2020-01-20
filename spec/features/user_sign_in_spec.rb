require 'rails_helper'

RSpec.feature "User Sign In", type: :feature do

  before do
    sign_up("email@example.com", "pass12", "pass12")
    click_link("Sign out")
    click_link("Log in")
  end

  scenario "displays a confirmation message when a user signs in" do
    fill_in "user_email", with: "email@example.com"
    fill_in "user_password", with: "pass12"
    click_button("Log in")
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Account: email@example.com")
  end

  scenario "displays an error message when the email address is incorrect" do
    fill_in "user_email", with: "email@"
    fill_in "user_password", with: "pass12"
    click_button("Log in")
    expect(page).to have_content("Invalid Email or password.")
    expect(page).to have_current_path('/users/sign_in')
  end

  scenario "displays an error message when the password is incorrect" do
    fill_in "user_email", with: "email@example.com"
    fill_in "user_password", with: "pass1245"
    click_button("Log in")
    expect(page).to have_content("Invalid Email or password.")
    expect(page).to have_current_path('/users/sign_in')
  end

end
