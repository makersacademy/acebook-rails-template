 require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "sign up page has name, email and password fields" do
    visit '/users/new'
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisa@email.com"
    fill_in "user_password", with: "Password"
    fill_in "user_password_confirmation", with: "Password"
    click_button "Sign Up"
    expect(page).to have_button("Sign Up")
    expect(page).to have_button("Sign In")
    expect(current_path).to eq('/users')
  end

  scenario "alert if password field is no between 6-10 characters" do
    visit '/users/new'
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisa@email.com"
    fill_in "user_password", with: "pass"
    fill_in "user_password_confirmation", with: "pass"
    click_button "Sign Up"
    expect(page).to have_content("Password must be 6-10 characters")
    expect(current_path).to eq('/users/new')
  end

  scenario "alert if passwords do not match" do
    visit '/users/new'
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisa@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "pastword"
    click_button "Sign Up"
    expect(page).to have_content("Passwords do not match")
    expect(current_path).to eq('/users/new')
  end

  scenario "alert if email address does not have an @ symbol" do
    visit '/users/new'
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisaemail.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign Up"
    expect(page).to have_content("Invalid email address")
    expect(current_path).to eq('/users/new')
  end

end
