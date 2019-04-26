require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "User not signed up and are redirect if they try to visit another URL" do
    visit "/posts"
    expect(page).to have_content("Sign up")
  end

  scenario "User prompted to sign up with email address and password" do
    visit "/"
    expect(page).to have_field("user_email")
    expect(page).to have_field("user_password")
    expect(page).to have_field("user_password_confirmation")
  end

  scenario "User can only enter valid email address" do
    visit "/"
    fill_in("user_email", with: "henryemail")
    fill_in("user_password", with: "password")
    fill_in("user_password_confirmation", with: "password")
    click_button("Sign up")
    expect(page).to have_content("Email is invalid")
  end

  scenario "User can only enter a password above 6 characters" do
    visit "/"
    fill_in("user_email", with: "test@test.com")
    fill_in("user_password", with: "pass")
    fill_in("user_password_confirmation", with: "pass")
    click_button("Sign up")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "User can only enter a password up to 10 characters" do
    visit "/"
    fill_in("user_email", with: "test@test.com")
    fill_in("user_password", with: "password1234")
    fill_in("user_password_confirmation", with: "password1234")
    click_button("Sign up")
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end

  scenario "User signs up and sees success message" do
    visit "/"
    fill_in("user_email", with: "test@test.com")
    fill_in("user_password", with: "password")
    fill_in("user_password_confirmation", with: "password")
    click_button("Sign up")
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_link("New post")
  end
end
