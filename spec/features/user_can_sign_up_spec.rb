require 'rails_helper'
RSpec.feature "Signing up", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
  end
  scenario "Can sign up successfully" do
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    expect(page).to have_content("User was successfully created")
    expect(page).to have_current_path("/")
  end
  scenario "Encounters error with invalid email" do
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Email is invalid")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when no first name is passed" do
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Firstname can't be blank")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when no last name is passed" do
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Lastname can't be blank")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when password is too short" do
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "12345"
    fill_in "user_password_confirmation", with: "12345"
    click_button "Create User"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when password is too long" do
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "12345678910"
    fill_in "user_password_confirmation", with: "12345678910"
    click_button "Create User"
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
    expect(page).to have_current_path("/users")
  end
  scenario "Encounters error when password conf doesn't match" do
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123457"
    click_button "Create User"
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to have_current_path("/users")
  end

  scenario "Encounters error when the email is already used by another user" do
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    click_link "Sign Up"
    fill_in "user_firstname", with: "test2firstname"
    fill_in "user_lastname", with: "test2lastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    expect(page).to have_content("Email has already been taken")
  end 

  scenario "page renders a back link" do
    expect(page).to have_link("Back")
  end

  scenario "back button should lead user back to the landing page" do
    click_link "Back"
    expect(page).to have_current_path('/')
  end
end