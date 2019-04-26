# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Log in", type: :feature do
  scenario "Signup form should have link to log in page" do
    visit "/"
    click_link("Click here to log in.")
    expect(page).to have_current_path("/login")
  end

  scenario "Login page should have email address and password fields" do
    visit "/login"
    expect(page).to have_field("Email address")
    expect(page).to have_field("Password")
  end

  scenario "Logging in succesfully takes you to the posts page" do
    visit "/"
    sign_up email: 'myemail@gmail.com', password: 'mypassword'
    click_link("Log out")

    log_in email: 'myemail@gmail.com', password: 'mypassword'

    expect(page).to have_current_path("/posts")
  end

  scenario "Trying to log in with invalid credentials returns to the login page" do
    visit "/"
    sign_up email: 'myemail@gmail.com', password: 'mypassword'
    click_link("Log out")

    log_in email: 'wrongemail@gmail.com', password: 'mypassword'

    expect(page).to have_current_path("/login")
  end

  context "Login password validation:-" do
    scenario "user should not log in with an invalid password" do
      sign_up email: 'myemail@gmail.com', password: 'mypassword'
      click_link("Log out")

      log_in email: 'myemail@gmail.com', password: 'wrongpassword'

      expect(page).to have_content("Invalid password")
    end

    scenario "user should not log in with an empty password" do
      sign_up email: 'myemail@gmail.com', password: 'mypassword'
      click_link("Log out")

      log_in email: 'myemail@gmail.com', password: ''

      expect(page).to have_content("Invalid password")
    end

    scenario "user should be able to log in with the correct password" do
      sign_up email: 'myemail@gmail.com', password: 'mypassword'
      click_link("Log out")

      log_in email: 'myemail@gmail.com', password: 'mypassword'

      expect(page).to have_content("Logged in successfully")
    end
  end
end
