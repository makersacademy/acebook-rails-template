require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do
  scenario "Anyone can Sign Up" do
    visit "/users/new"
    fill_in "user[username]", with: "NewUser123"
    fill_in "user[email]", with: "newuser123@gmail.com"
    fill_in "user[password]", with: "password1"
    choose('user[ethnicity]', option: "asian")
    click_button "Sign Up"
    expect(page).to have_content("Welcome NewUser123!")
  end

  scenario "Requires all fields" do
    visit "/users/new"
    fill_in "user[username]", with: "NewUser123"
    fill_in "user[email]", with: "newuser123@gmail.com"
    fill_in "user[password]", with: "password1"
    click_button "Sign Up"
    expect(page).to have_content("Ethnicity can't be blank")
  end
end