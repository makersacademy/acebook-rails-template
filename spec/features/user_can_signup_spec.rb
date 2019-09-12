require "rails_helper"

RSpec.feature "Sign up", type: :feature do
  scenario "Can Sign up" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    expect(page).to have_current_path("/")
    expect(page).to have_content("Hello test@gmail.com! You are now signed in")
  end

  scenario "Cannot Sign Up with an invalid email" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "testgmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    expect(page).to have_content("Email is invalid Email Password (6 characters minimum)")
  end

  scenario "Cannot Sign Up if password is < 6 characters" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "12345"
    fill_in "user[password_confirmation]", with: "12345"
    click_button "Sign up"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "Cannot Sign Up if password is > 10 characters" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "password123"
    fill_in "user[password_confirmation]", with: "password123"
    click_button "Sign up"
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end
end
