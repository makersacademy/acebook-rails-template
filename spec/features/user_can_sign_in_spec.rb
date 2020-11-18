require 'rails_helper'

RSpec.feature "Sign In", type: :feature do
  scenario "Can sign in" do
    add_new_user
    visit '/sessions/new'
    fill_in "email", with: "test@testing.com"
    fill_in "password", with: "test1234"
    click_button("Log In")

    expect(page).to have_content("Test Person")
  end

  scenario "Users that don't exist cannot sign-in" do
    visit '/sessions/new'
    fill_in "email", with: "test12345@testing.com"
    fill_in "password", with: "test1234"
    click_button("Log In")
    expect(page).to have_content("Log in to Acebook")
    expect(page).to have_content("Email or Password is incorrect. Try again, or sign up!")
  end
end

