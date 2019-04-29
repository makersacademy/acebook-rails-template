# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Sign up", type: :feature do
  scenario "Logged out users should be redirected from posts to sign up page" do
    visit "/posts"
    expect(page).to have_current_path("/")
  end

  context "You can get from the log in page to the sign up page" do
    scenario "The log in page has a link to the sign up page" do
      visit "/login"
      expect(page).to have_link("Sign up for one here")
    end

    scenario "The link goes to the sign up page" do
      visit "/login"
      click_link("Sign up for one here")
      expect(page).to have_current_path("/")
    end
  end

  scenario "Logged out users should get see a message when they get redirected" do
    visit "/posts/new"
    expect(page).to have_content("You must be logged in to access that page")
  end

  scenario "Signup form should have email address and password fields" do
    visit "/"
    expect(page).to have_field("Email address")
    expect(page).to have_field("Password")
  end

  scenario "Completing the signup form navigates to posts page" do
    sign_up
    expect(page).to have_current_path("/posts")
  end

  scenario "Completing the signup form signs you in" do
    sign_up
    expect(page).to have_link("Log out")
  end

  scenario "A confirmation message is shown after the user signs up" do
    sign_up
    expect(page).to have_content("New account created")
  end

  context "User must provide a valid email address" do
    scenario "User must provide an email address" do
      sign_up(email: "", password: "abc123")
      expect(page).to have_content("Email field cannot be empty")
    end

    scenario 'Email address must contain "@" symbol' do
      sign_up(email: "myemail", password: "abc123")
      expect(page).to have_content("Invalid email address")
    end

    scenario "Email address must have a local part" do
      sign_up(email: "@myemail", password: "abc123")
      expect(page).to have_content("Invalid email address")
    end

    scenario "Email address must have a domain" do
      sign_up(email: "myemail@", password: "abc123")
      expect(page).to have_content("Invalid email address")
    end

    scenario "Email address must have a TLD" do
      sign_up(email: "myemail@domain", password: "abc123")
      expect(page).to have_content("Invalid email address")
    end

    scenario "Email must be unique" do
      sign_up(email: "myemail@hotmail.com", password: "abc123")
      sign_up(email: "myemail@hotmail.com", password: "xyx789")
      expect(page).to have_content("An account with this email already exists")
    end

    scenario "Email must be unique disregarding case" do
      sign_up(email: "myemail@hotmail.com", password: "abc123")
      sign_up(email: "myemail@HOTMAIL.com", password: "xyx789")
      expect(page).to have_content("An account with this email already exists")
    end
  end

  context "User must provide a valid password" do
    scenario "User must provide a password" do
      sign_up(email: "myemail@hotmail.com", password: "")
      expect(page).to have_content("Password field cannot be empty")
    end

    scenario "Password must be at least 6 characters" do
      sign_up(email: "myemail@hotmail.com", password: "12345")
      expect(page).to have_content("Password too short - must be 6-10 characters in length")
    end

    scenario "Password must be at most 10 characters" do
      sign_up(email: "myemail@hotmail.com", password: "1234567890a")
      expect(page).to have_content("Password too long - must be 6-10 characters in length")
    end
  end
end
