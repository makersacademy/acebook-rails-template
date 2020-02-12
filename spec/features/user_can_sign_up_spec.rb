require 'rails_helper'

RSpec.feature "User", type: :feature do
  scenario "Can sign up for account" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "cats@cats.com"
    fill_in "Password", with: "cats1234"
    fill_in "Password confirmation", with: "cats1234"
    click_button "Sign Up"
    expect(page).to have_content("You have signed up successfully.")
  end
end