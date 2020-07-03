require 'rails_helper'
RSpec.feature "Signing up", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
  end
  scenario "Can sign up successfully" do
    fill_in "First Name", with: "Al"
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Create User"
    expect(page).to have_content("User was successfully created")
    expect(page).to have_current_path("/")
  end
  scenario "Encounters error with invalid email" do
    fill_in "First Name", with: "Al"
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "algmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Email is invalid")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when no first name is passed" do
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Firstname can't be blank")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when no last name is passed" do
    fill_in "First Name", with: "Al"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Lastname can't be blank")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when password is too short" do
    fill_in "First Name", with: "Al"
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "12345"
    fill_in "Confirm Password", with: "12345"
    click_button "Create User"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when password is too long" do
    fill_in "First Name", with: "Al"
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "12345678901"
    fill_in "Confirm Password", with: "12345678901"
    click_button "Create User"
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when password conf doesn't match" do
    fill_in "First Name", with: "Al"
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123457"
    click_button "Create User"
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to have_current_path("/users")
  end

  scenario "Encounters error when the email is already used by another user" do
    fill_in "First Name", with: "Al"
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Create User"
    click_link "Sign Up"
    fill_in "First Name", with: "Al"
    fill_in "Last Name", with: "Sumner"
    fill_in "Email", with: "al@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Email has already been taken")
  end 
end