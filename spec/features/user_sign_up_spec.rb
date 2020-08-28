require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up as a new user" do
    visit "/"
    create_new_user
    expect(page).to have_content("Successfully created user account")
  end

  scenario "Invalid email address" do
    visit "/"
    fill_in "first_name", with: "Paul"
    fill_in "last_name", with: "Humphreys"
    fill_in "email", with: "emailemail.com"
    fill_in "password", with: "12345"
    fill_in "password_confirmation", with: "12345"
    click_button "Create User"
    expect(page).to have_content("Please check submitted information")
  end

  scenario "Password too short" do
    visit "/"
    fill_in "first_name", with: "Paul"
    fill_in "last_name", with: "Humphreys"
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "12345"
    fill_in "password_confirmation", with: "12345"
    click_button "Create User"
    expect(page).to have_content("Please check submitted information")
  end

  scenario "Password too long" do
    visit "/"
    fill_in "first_name", with: "Paul"
    fill_in "last_name", with: "Humphreys"
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "12345678910"
    fill_in "password_confirmation", with: "12345678910"
    click_button "Create User"
    expect(page).to have_content("Please check submitted information")
  end

  scenario "No first name" do
    visit "/"
    fill_in "last_name", with: "Humphreys"
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "123456"
    fill_in "password_confirmation", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Please check submitted information")
  end

  scenario "Password's don't match" do
    visit "/"
    fill_in "first_name", with: "Paul"
    fill_in "last_name", with: "Humphreys"
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "12345"
    fill_in "password_confirmation", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Please check submitted information")
  end
end
