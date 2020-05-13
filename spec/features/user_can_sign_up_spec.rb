require 'rails_helper'

RSpec.feature "Sign-up", type: :feature do
  scenario "Root takes you to the signup page" do
    visit "/"
    expect(page).to have_content("Sign-up")
  end

  xscenario "User can sign up with their name, email and password" do
    #will change test when we redirect after sign up
    visit "/"
    fill_in "user[name]", with: "Gina"
    fill_in "user[email]", with: "gina@example.com"
    fill_in "user[password]", with: "123456"
    click_on "Sign up"
    expect(page).to have_content("Welcome Gina!")
  end

  scenario "error message for invalid credentials" do
    User.create(name: "Gina", email: "gina@example.com", password: "123456")
    visit "/"
    fill_in "user[name]", with: "Gina"
    fill_in "user[email]", with: "gina.example"
    fill_in "user[password]", with: "1234"
    click_on "Sign up"
    expect(page).to have_content("Name has already been taken")
    expect(page).to have_content("Not a valid email address")
    expect(page).to have_content("Password too short")
  end
end