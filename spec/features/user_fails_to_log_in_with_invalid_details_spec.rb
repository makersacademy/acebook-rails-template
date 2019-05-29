require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "User fails to log in with invalid details" do
    visit '/login'
    fill_in "Email", with: "invalid@email.com"
    fill_in "Password", with: "invalidpassword"
    click_button 'Submit'
    expect(page).to have_content "Log in"
    expect(page).to have_content "Incorrect email/password"
  end
end
