require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can create an account" do
    visit "/signup"
    fill_in "Name", with: "Ben"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "1234"
    fill_in "Confirm Password", with: "1234"
    click_button "Sign up"
    expect(page).to have_content("New post")
  end
end
