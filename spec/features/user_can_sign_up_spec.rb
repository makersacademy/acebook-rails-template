require 'rails_helper'

feature "Signing Up" do

  scenario "New user signs up from index page" do
    visit "/"
    click_button "Sign up"
    expect(current_path).to eq('/users/sign_up')
  end

  scenario "Can sign up with valid details" do
    visit "/users/sign_up"
    fill_in "Email", with: "mob@example.com"
    fill_in "Password", with: "Passwrd1"
    fill_in "Password confirmation", with: "Passwrd1"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(current_path).to eq("/posts")
  end

  scenario "Signing up with a password that is too long" do
    visit "/users/sign_up"
    fill_in "Email", with: "mob@example.com"
    fill_in "Password", with: "12345678910"
    fill_in "Password confirmation", with: "12345678910"
    click_button "Sign up"
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
    expect(current_path).to eq("/users")
  end

  scenario "signing up with a password that is too short" do
    visit "/users/sign_up"
    fill_in "Email", with: "mob@example.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_button "Sign up"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
    expect(current_path).to eq("/users")
  end

  scenario "signing up with a mismatched password" do
    visit "/users/sign_up"
    fill_in "Email", with: "mob@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "1234567"
    click_button "Sign up"
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(current_path).to eq("/users")
  end

  scenario "signing up with an invalid email address" do
    visit "/users/sign_up"
    fill_in "Email", with: "mobexample.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    expect(page).to have_content("Email is invalid")
    expect(current_path).to eq("/users")
  end

  scenario "signing up with a duplicate email address can easily log in instead" do
    User.create(:email => 'testenv@example.com', :password => 'testpass')
    visit "/users/sign_up"
    fill_in "Email", with: "testenv@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    expect(page).to have_content("This email address has already signed up")
    expect(page).to have_link("Already registered? Log in here", :href => "/users/sign_in")
  end
end
