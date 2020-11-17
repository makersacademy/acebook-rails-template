require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up" do
    visit "/users/new"
    fill_in "user_name", with: "Test Person"
    fill_in "user_email", with: "test@testing.com"
    fill_in "user_password", with: "test1234"
    fill_in "user_password_confirmation", with: "test1234"
    click_button "submit_sign_up"
    expect(page).to have_content("Test Person")
  end
end