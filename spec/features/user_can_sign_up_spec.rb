require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up for an account on Acebook" do
    visit "/users/new"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "john@doe.com"
    fill_in "Password", with: "john1234"
    click_button "Submit"
    expect(page).to have_content("Log in")
  end
end
