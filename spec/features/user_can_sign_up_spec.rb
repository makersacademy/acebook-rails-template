require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up" do
    visit "/users/new"
    fill_in "name", with: "Test Person"
    fill_in "email", with: "test@testing.com"
    fill_in "password", with: "test1234"
    click_button "Submit"
    expect(page).to have_content("Test Person")
  end
end