require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "user can sign up" do
    visit "/users/sign_up"
    fill_in "user_username", with: "Bob"
    fill_in "user_email", with: "bob@example.com"
    fill_in "user_password", with: "password1!"
    fill_in "user_password_confirmation", with: "password1!"
    click_button "Sign up"
    expect(current_path).to eq '/'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "user can't sign up if fields are blank" do
    visit "/users/sign_up"
    click_button "Sign up"
    expect(current_path).to eq '/users'
    expect(page).to have_content("2 errors prohibited this user from being saved")
  end
end