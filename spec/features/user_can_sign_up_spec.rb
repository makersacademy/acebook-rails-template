require 'rails_helper'

feature "Signing Up" do

  scenario "New user signs up from index page  " do
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


end
