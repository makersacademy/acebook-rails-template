require 'rails_helper'

RSpec.feature "Passwords", type: :feature do
  scenario "must be at least 6 characters" do
    visit "/users/sign_up"
    fill_in "user_email", with: "bob@bob.com"
    fill_in "user_password", with: "123"
    fill_in "user_password_confirmation", with: "123"
    click_button "Sign up"
    expect(page).to have_content("1 error prohibited this user from being saved")
    expect(page).to have_content("minimum is 6 characters")
  end

  scenario "must be no longer than 10 characters" do
    visit "/users/sign_up"
    fill_in "user_email", with: "bob@bob.com"
    fill_in "user_password", with: "123123123123"
    fill_in "user_password_confirmation", with: "123123123123"
    click_button "Sign up"
    expect(page).to have_content("1 error prohibited this user from being saved")
    expect(page).to have_content("maximum is 10 characters")
  end
end
