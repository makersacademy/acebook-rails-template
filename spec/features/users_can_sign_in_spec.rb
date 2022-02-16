require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do 
    visit "/users/sign_up"
    fill_in "Name", with: "Amy Ace"
    fill_in "Email", with: "bananas@gmail.com"
    fill_in "Password", with: "12345678"
    fill_in "user[password_confirmation]", with: "12345678"
    click_button "Sign up"

    click_link "Sign Out"
  end

  scenario "Can sign in to their myAce account" do
    visit "/users/sign_in"
    fill_in "Email", with: "bananas@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"

    expect(page).to have_content "Sign Out"
  end 

  scenario "Can sign in to their myAce account" do
    visit "/users/sign_in"
    fill_in "Email", with: "bananas@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"

    expect(page).to have_content "Amy Ace's profile page"
  end

  scenario "User is redirected to their profile page on sign_in" do
    visit "/users/sign_in"
    fill_in "Email", with: "bananas@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"

    expect(page).to have_content "Amy Ace's profile page"
  end

end
