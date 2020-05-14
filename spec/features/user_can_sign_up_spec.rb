require 'rails_helper'

RSpec.feature "Sign-up", type: :feature do
  scenario "Root takes you to the signup page" do
    visit "/"
    expect(page).to have_content("Sign-up")
  end

  scenario "User can sign up with their name, email and password" do
    visit "/"
    fill_in "user[name]", with: "Gina"
    fill_in "user[email]", with: "gina@example.com"
    fill_in "user[password]", with: "123456"
    click_on "Sign up"
    expect(page).to have_current_path "/users/#{User.first.id}"
  end

  scenario "error message for invalid credentials" do
    User.create(name: "Gina", email: "gina@example.com", password: "123456")
    visit "/"
    fill_in "user[name]", with: "Gina"
    fill_in "user[email]", with: "gina.example"
    fill_in "user[password]", with: "1234"
    click_on "Sign up"
    expect(page).to have_content("Name has already been taken")
    expect(page).to have_content("Email is invalid")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "error message for invalid credentials (password too long, email taken)" do
    User.create(name: "Gina", email: "gina@example.com", password: "123456")
    visit "/"
    fill_in "user[name]", with: "Gina"
    fill_in "user[email]", with: "gina@example.com"
    fill_in "user[password]", with: "12345678910"
    click_on "Sign up"
    expect(page).to have_content("Name has already been taken")
    expect(page).to have_content("Email has already been taken")
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end
end