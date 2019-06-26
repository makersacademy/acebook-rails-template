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

  scenario "password field between 6-10 characters" do
    visit '/users/new'
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisa@email.com"
    fill_in "user_password", with: "pass"
    fill_in "user_password_confirmation", with: "pass"
    click_button "Sign Up"
    expect(page).to have_content("Invalid signup credentials")
    expect(current_path).to eq('/users/new')
  end

  scenario "passwords do not match" do
    visit '/users/new'
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisa@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "pastword"
    click_button "Sign Up"
    expect(page).to have_content("Invalid signup credentials")
    expect(current_path).to eq('/users/new')
  end

  scenario "email address does not have an @" do
    visit '/users/new'
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisaemail.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign Up"
    expect(page).to have_content("Invalid signup credentials")
    expect(current_path).to eq('/users/new')
  end

  scenario "email address does not have an @" do
    visit '/users/new'
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisa@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign Up"
    visit '/users/new'
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisa@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign Up"
    expect(page).to have_content("Invalid signup credentials")
    expect(current_path).to eq('/users/new')
  end

end
