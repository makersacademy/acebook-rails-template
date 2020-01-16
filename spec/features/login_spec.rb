require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "Can log in as a user" do
    signup
    login
    expect(page).to have_content("New post")
  end

  scenario "When a user enters invalid email" do
    signup
    visit "/login"
    fill_in "Email", with: "ken@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
    expect(page).to have_content("Invalid email/password combination")
  end

  scenario "When a user enters invalid password" do
    signup
    visit "/login"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "111111"
    click_button "Log in"
    expect(page).to have_content("Invalid email/password combination")
  end
end
