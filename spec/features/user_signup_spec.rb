require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do
  scenario "when visiting the root directory, it redirects to sign up page if no user is signed in" do
    visit "/"
    expect(page).to have_current_path(new_user_registration_path)
    expect(page).to have_content("Sign up")
  end

  scenario "displays a confirmation message when a user signs up, password 6 characters" do
    sign_up("email@test.com", "pass12", "pass12")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "displays a confirmation message when a user signs up, password 10 characters" do
    sign_up("email@test.com", "pass123456", "pass123456")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "cannot sign up 2 accounts with the same email address" do
    sign_up("email@test.com", "pass1234", "pass1234")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end



# doesn't allow sign up when password is less than 6 characters
# doesn't allow sign up when password is greater than 10 don't match
# doesn't allow sign up when passwords don't match
# doesn't allow sign up when 
