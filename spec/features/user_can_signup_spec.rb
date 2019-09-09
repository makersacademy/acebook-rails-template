require 'rails_helper'

RSpec.feature "Log in/out", type: :feature do
  scenario "Can Sign Up" do
    visit "/sign_up"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "password"
    click_button "Sign up"
    expect(page).to have_content("Hello")
  end

  scenario "Can Log In When Already Signed Up" do 
    visit "/sign_up"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "password"
    click_button "Sign up"
    click_button "Sign out"
    visit "/sign_in"
    fill_in "session_email", with: "test@test.com"
    fill_in "session_password", with: "password"
    click_button "Sign in"
    expect(page).to have_content("Hello")
  end

  scenario "Can request password reset email" do
    visit "/passwords/new" 
    fill_in "password_email", with: "test@test.com"
    click_button "Reset password"
    expect(page).to have_content("changing your password.")
  end

  scenario "Can Log Out when Logged In" do 
    visit "/sign_up"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "password"
    click_button "Sign up"
    click_button "Sign out"
    expect(page).to have_content("Sign in")
  end
end

