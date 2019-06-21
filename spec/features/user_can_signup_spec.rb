require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  context "Form data" do

    scenario "it has an email field" do
      go_to_homepage

      expect(page).to have_field("user[email]") 
    end

    scenario "it has a password field" do
      go_to_homepage

      expect(page).to have_field("user[password]") 
    end
  end


  context "User must fill in a valid password" do
    scenario "user left password field empty" do
      sign_up(email: "test@test.com", password: "")

      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end

    scenario "user provides a password sorter than 6 characters" do
      sign_up(email: "test@test.com", password: "12345")

      expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end

    scenario "user provides a password longer than 10 characters" do
      sign_up(email: "test@test.com", password: "12345678910")

      expect(page).to have_content("Password is too long (maximum is 10 characters)")
    end

    scenario "user leaves password confirmation field blank" do
      sign_up(email: "test@test.com", password: "12345678910")
      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    scenario "user fill in password confirmation with a different password" do
      sign_up(email: "test@test.com", password: "12345678910")
      expect(page).to have_content("Password confirmation doesn't match Password")
    end

  end

  context "User must provide a valid email address" do
    scenario "user left email field empty" do 
      sign_up(email: "", password: "123456789")

      expect(page).to have_content("Email can't be blank")
    end

    scenario "user provides an email address that has already been taken" do
      sign_up(email: "test@test.com", password: "123456789")

      expect(page).to have_current_path("/posts")

      sign_up(email: "test@test.com", password: "12345")

      expect(page).to have_content("Email has already been taken")
    end

    scenario "user provides an email address that doesn't have 'at sign'" do
      sign_up(email: "testtest.com", password: "123456789")

      expect(page).to have_content("Email is invalid")
    end

    scenario "user provides an email address that doesn't have unique user name" do
      sign_up(email: "@test.com", password: "123456789")

      expect(page).to have_content("Email is invalid")
    end

    scenario "user provides an email address that doesn't have domain name" do
      sign_up(email: "test@", password: "123456789")

      expect(page).to have_content("Email is invalid")
    end
  end

  scenario "after completing the signup form it navigates to posts page" do
    sign_up(email: "test@test.com", password: "password")

    expect(page).to have_current_path("/posts")
    expect(page).to have_content("Welcome to Acebook by D-Railed!")
  end

end
