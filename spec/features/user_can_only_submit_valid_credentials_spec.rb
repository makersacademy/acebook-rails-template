require 'rails_helper'

RSpec.feature "Sign up credentials", type: :feature do
  scenario "Can only submit valid sign up credentials" do
    visit "/users/new"
    fill_in "Firstname", with: " "
    fill_in "Lastname", with: " "
    fill_in "Email", with: "testexample.com"
    fill_in "Password", with: "pass"
    click_button "Submit"
    expect(page).not_to have_content("Welcome to Acebook")
  end
end
