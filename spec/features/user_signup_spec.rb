require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "User can sign up" do
    visit "/welcome"
    click_button "Sign Up"
    fill_in "Username", with: "JooMin"
    fill_in "Password", with: "123"
    click_button "Create User"
    expect(page).to have_content("Welcome")
  end
end
