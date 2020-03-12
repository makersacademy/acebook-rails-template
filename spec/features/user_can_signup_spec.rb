require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    visit "/users/new"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    expect(page).to have_content("Sign Up successful!")
  end
  scenario "User sees their flash message disappear" do
    visit "/users/new"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    expect(page).to have_content("Sign Up successful!")
    visit "/posts/yours"
    expect(page).not_to have_content("Sign Up successful!")
  end
end
