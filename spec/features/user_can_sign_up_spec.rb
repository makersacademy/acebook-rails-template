require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "Can sign up for account" do
    visit "/"
    click_button "Sign Up"
    fill_in "Name", with: "Mr Meow"
    fill_in "Username", with: "@cat123"
    fill_in "Email", with: "cats@cats.com"
    fill_in "Password", with: "cats"
    click_button "Submit"
    expect(page).to have_content("Welcome, @cat123!")
  end
end
