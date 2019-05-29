require 'rails_helper'

RSpec.feature "Log in", type: :feature do

  before(:each) do
    visit("/users/sign_up")
  end

  scenario "can see Login link" do
    expect(page).to have_link("Login")
  end

  scenario "throws error if email or password is incorrect, same message if account doesn't exist" do
    click_link "Login"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "testpassword"
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password")
  end

  scenario "successful Login redirects to posts page" do
    create_user_test_email_dot_com_1234567
    click_link "Logout"
    click_link "Login"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "1234567"
    click_button "Log in"
    expect(page).to have_content("New post")
  end
end
