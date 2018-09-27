require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    visit "/users/new"
    fill_in "Full name", with: "My Name"
    fill_in "Email", with: "ab@cd.com"
    fill_in "Password", with: "123456"

    click_button "Submit"

    expect(page).to have_content("You have signed up successfully")
  end
end
