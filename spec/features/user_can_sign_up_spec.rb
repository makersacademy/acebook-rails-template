require 'rails_helper'

RSpec.feature "Sign-up", type: :feature do
  scenario "Root takes you to the signup page" do
    visit "/"
    expect(page).to have_content("Sign-up")
  end

  xscenario "User can sign up with their name, email and password" do
    visit "/"
    fill_in "user[name]", with: "Gina"
    fill_in "user[email]", with: "gina@example.com"
    fill_in "user[password]", with: "12345"
    click_on "Sign up"
    expect(page).to have_content("Welcome Gina!")
  end
end