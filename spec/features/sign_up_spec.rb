require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can create an account" do
    visit "/signup"
    fill_in "Name", with: "Ben"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Sign up"
    expect(page).to have_content("New post")
  end

  scenario "When a registered user tries to sign up" do
    signup
    click_on "Logout"
    visit "/signup"
    fill_in "Name", with: "Ben"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Sign up"
    expect(page).to have_content("Already a user, please log in")
  end
  
  scenario "When a user enters invalid password" do
    visit "/signup"
    fill_in "Name", with: "Ben"
    fill_in "Email", with: "ben@gmail.com"
    fill_in "Password", with: "1222"
    fill_in "Confirm Password", with: "1222"
    click_button "Sign up"
    expect(page).to have_content("Password must be at least 6 characters and no more than 10")
  end
end
