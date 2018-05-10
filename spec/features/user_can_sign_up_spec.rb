require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "The user can sign up successfully" do
    visit "/users/sign_up"
    fill_in "user_email", with: "jordan@matt.com"
    fill_in "user_password", with: "123456abc"
    fill_in "user_password_confirmation", with: "123456abc"
    click_button "Sign up"
    expect(page).to have_content("Signup successful, welcome jordan@matt.com")
  end
=begin
  scenario "The user does not enter valid signup credentials" do
    visit "/users/sign_up"
    fill_in "user_email", with: "jordan@matt.com"
    click_button "Sign up"
    expect(page).to have_content("Please sign up with a valid email/password")
  end
=end
end