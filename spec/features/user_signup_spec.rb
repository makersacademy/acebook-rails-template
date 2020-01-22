require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do
  scenario "when visiting the root directory, it redirects to sign up page if no user is signed in" do
    visit "/"
    expect(page).to have_current_path(new_user_registration_path)
    expect(page).to have_content("Sign up")
  end

  scenario "displays a confirmation message when a user signs up, password 6 characters" do
    sign_up("Example1", "email@example.com", "pass12", "pass12")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "displays a confirmation message when a user signs up, password 10 characters" do
    sign_up("Example1", "email@example.com", "pass123456", "pass123456")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "displays an error message if the password is too short (<6 characters)" do
    sign_up("Example1", "email@example.com", "pass", "pass")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "displays an error message if the password is too long (>10 characters)" do
    sign_up("Example1", "email@example.com", "pass1234567", "pass1234567")
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end

  scenario "cannot sign up 2 accounts with the same username" do
    sign_up("Example1", "email@example.com", "pass123456", "pass123456")
    click_link 'Sign out'
    expect(page).to have_content("Sign up")

    sign_up("Example1", "testing@example.com", "pass123456", "pass123456")
    expect(page).to have_content("Username has already been taken")
  end

  scenario "cannot sign up 2 accounts with the same username in all caps" do
    sign_up("Example1", "email@example.com", "pass123456", "pass123456")
    click_link 'Sign out'
    expect(page).to have_content("Sign up")

    sign_up("EXAMPLE1", "testing@example.com", "pass123456", "pass123456")
    expect(page).to have_content("Username has already been taken")
  end

  scenario "cannot sign up 2 accounts with the same email address" do
    sign_up("Example1", "email@example.com", "pass123456", "pass123456")
    click_link 'Sign out'
    expect(page).to have_content("Sign up")

    sign_up("Example1", "email@example.com", "pass123456", "pass123456")
    expect(page).to have_content("Email has already been taken")
  end

  scenario "displays an error message if the password confirmation doesn't match password" do
    sign_up("Example1", "email@example.com", "pass123", "pass1234")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "displays an error message if the email is invalid (email)" do
    sign_up("Example1", "email", "pass123", "pass123")
    expect(page).to have_content("Email is invalid  ")
    expect(page).to have_current_path('/users')
  end

  scenario "displays an error message if the email is invalid (email@)" do
    sign_up("Example1", "email@", "pass123", "pass123")
    expect(page).to have_content("Email is invalid  ")
    expect(page).to have_current_path('/users')
  end

  scenario "displays an error message if the email is invalid (email.com)" do
    sign_up("Example1", "email.com", "pass123", "pass123")
    expect(page).to have_content("Email is invalid")
    expect(page).to have_current_path('/users')
  end
end
