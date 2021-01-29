require 'rails_helper' 
require 'web_helper'
RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up to make an account" do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "mrtester"
    fill_in "Email", with: "mrtester@test.com"
    fill_in "Password", with: "test123"
    fill_in "Password confirmation", with: "test123"
    click_button "Sign Up"
    expect(page).to have_content("Logged in as ")
  end 

  scenario "Expect error to be thrown if passwords not matching" do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "mrtester"
    fill_in "Email", with: "mrtester@test.com"
    fill_in "Password", with: "test123"
    fill_in "Password confirmation", with: "testabc" 
    click_button "Sign Up"
    expect(page).to have_content("Password confirmation doesn't match")
  end 

  scenario "Expect error to be thrown if a sign up field is missing" do
    visit "/"
    click_link "Sign Up"
    fill_in "Username", with: "mrtester"
    fill_in "Email", with: ""
    fill_in "Password", with: "test123"
    fill_in "Password confirmation", with: "test123" 
    click_button "Sign Up"
    expect(page).to have_content("")
  end 

end





