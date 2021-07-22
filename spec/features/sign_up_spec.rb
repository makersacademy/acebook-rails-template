require 'rails_helper'

RSpec.feature "User authentication", type: :feature do
  scenario "user can sign up" do
    visit "/"
    
    fill_in "email_field", with: "test@test.com"
    fill_in "password", with: "testing123"
    fill_in "password_confirmation", with: "testing123"

    click_button "Sign up"
    expect(page).to have_content("Welcome, test@test.com")
  end
end