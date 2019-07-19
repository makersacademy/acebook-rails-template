require "rails_helper"

RSpec.feature "User can only enter password between 6 - 10 characters inclusive", type: :feature do
  scenario "User enters password with 4 characters" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "tesymcemail@email.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_button "Sign up"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end
end
