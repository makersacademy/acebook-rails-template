require 'rails_helper'

feature 'Log in' do
  scenario "A registered user can log in" do
    sign_up
    click_link "Log out"
    click_button "Log In"
    fill_in "Email", with: "bob@test.com"
    fill_in "Password", with: "Bobobob"
    click_button "Login"
    expect(page).to have_current_path('/')
    expect(page).to have_content("Welcome Bob")
    expect(page).to have_content("Log out")
  end

  scenario "An unregistered user cannot see a log out button" do
    visit "/welcome"
    expect(page).not_to have_content("Log out")
  end

  scenario "A user that has not signed up cannot log in" do
    log_in
    expect(page).not_to have_content("Welcome Bob")
    expect(page).to have_content("Login")
  end

end