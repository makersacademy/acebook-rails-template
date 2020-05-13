require 'rails_helper'

RSpec.feature "Log-in", type: :feature do
  scenario "User can log in with their name and password" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    visit "/sessions/new"
    fill_in "session[name]", with: "Gina"
    fill_in "session[password]", with: "123456"
    click_on "Log in"
    expect(page).to have_content("Welcome to your wall, Gina!")
  end

  scenario "Errors raised for invalid credentials" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    visit "/sessions/new"
    fill_in "session[name]", with: "Gine"
    fill_in "session[password]", with: "1234567"
    click_on "Log in"
    expect(page).to have_content("Name and/or Password is incorrect")
  end
end