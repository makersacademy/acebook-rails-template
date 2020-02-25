require 'rails_helper'

RSpec.feature "signup", type: :feature do
  scenario "Throws error with invalid input" do
    visit "/"
    fill_in "user[username]", with: "Toby Brock"
    fill_in "user[email]", with: "tobybrock93@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Create my account"
    expect(page).to have_content("Welcome to MugManual!")
  end
end
