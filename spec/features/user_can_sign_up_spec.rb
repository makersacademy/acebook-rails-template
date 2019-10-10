require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do
  scenario "Anyone can Sign Up" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "newuser123@gmail.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    click_button
    expect(page).to have_content("Welcome newuser123@gmail.com!")
  end

  scenario "Requires password confirmation to match" do
    visit "/users/sign_up"
    fill_in "user[email]", with: "newuser123@gmail.com"
    fill_in "user[password]", with: "password1"
    click_button
    expect(page).to have_content("Password confirmation doesn't match Password Email")
  end
end
