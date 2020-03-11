require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    visit "/users/new"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    expect(page).to have_link("New post")
  end
end
