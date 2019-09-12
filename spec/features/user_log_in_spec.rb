require "rails_helper"

RSpec.feature "Log in", type: :feature do
  scenario "Can Log in" do
    visit "/"
    fill_in "user[email]", with: "test@gmail.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_button "Sign up"
    click_link "Logout"
    click_link "Log in"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    click_button "Log in"
    expect(page).to have_current_path("/")
    expect(page).to have_content("Hello test@gmail.com! You are now signed in")
  end

  scenario "Is redirected to login page if user does not exist" do
    visit "/"
    click_link "Log in"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    click_button "Log in"
    expect(page).to have_current_path("/users/sign_in")
  end
end