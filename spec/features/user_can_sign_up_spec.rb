require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    visit "/users/new"
    fill_in "full name", with: "My Name"
    fill_in "handle", with: "My Handle"
    fill_in "email", with: "ab@cd.com"
    fill_in "password", with: "123456"

    click_button "Submit"

    expect(page).to have_content("You are now signed up")
  end
end
