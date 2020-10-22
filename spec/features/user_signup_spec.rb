require 'rails_helper'

feature "Signup" do
  scenario "Can sign up with name, email and password" do
    visit "/welcome"
    click_button "Sign Up"
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bob@test.com"
    fill_in "Password", with: "Bobobob"
    click_button "Create User"
    expect(page).to have_content("Welcome Bob")
  end

  scenario "Displays error when name, email or password not provided" do
    visit "/welcome"
    click_button "Sign Up"
    fill_in "Name", with: "Bob"
    fill_in "Password", with: "Bobobob"
    click_button "Create User"
    expect(page).to have_content("Email can't be blank")
  end

  scenario "it prevents singup with duplicated email address" do
    sign_up
    click_link "Log out"
    sign_up
    expect(page).to have_content("Email has already been taken")
  end

end
