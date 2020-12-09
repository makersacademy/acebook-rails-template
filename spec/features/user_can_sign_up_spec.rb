require 'rails_helper'

feature "Signing Up" do
  scenario "Can sign up with valid details" do
    visit "/sign-up"
    fill_in "Email", with: "mob@example.com"
    fill_in "Password", with: "Passwrd1"
    click_button "Submit"
    expect(page).to have_content("You've signed up!")
    expect(path).to eq("/posts")
  end
end
