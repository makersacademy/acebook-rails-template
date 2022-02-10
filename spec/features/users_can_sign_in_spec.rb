require 'rails_helper'


RSpec.feature "Timeline", type: :feature do
  before(:each) do 
    visit "/users/sign_up"
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

    expect(page).to have_content "New post"
  end

  scenario "User is redirected to their posts page" do
    visit "/users/sign_in"
    fill_in "Email", with: "bananas@gmail.com"
    fill_in "Password", with: "12345678"
    click_button "Log in"

    expect(page).to have_content "Welcome bananas@gmail.com"
  end

end

# When a user hasn't signed in and visits the index of the application:

# - if they visit another URL, they are redirected to the index
# - they can see a link to a sign in page which prompts them to enter in their email address and password.
# - they can only enter valid emails
# - When they submit their details, they are logged in and redirected to their posts page.