require 'rails_helper'

RSpec.feature "Sign in", type: :feature do
  scenario "Users can sign in" do
    visit "/"
    fill_in "Email", with: "bob@bob.com"
    fill_in "Password", with: "bbbbbbb"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
  end
end
