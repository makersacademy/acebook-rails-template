require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    visit "/users/new"
    fill_in "First Name", with: "Test"
    fill_in "Last Name", with: "Example"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    click_button "Submit"
    expect(page).to have_content("Welcome to Acebook")
  end
end
