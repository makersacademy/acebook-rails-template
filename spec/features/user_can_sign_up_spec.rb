require 'rails_helper'

feature "Signing Up" do
  scenario "Can sign up with valid details" do
    visit "/users/sign_up"
    fill_in "Email", with: "mob@example.com"
    fill_in "Password", with: "Passwrd1"
    fill_in "Password confirmation", with: "Passwrd1"
    click_button "Sign up"
    expect(page).to have_content("You've signed up!")
    expect(current_path).to eq("/")
  end
end
