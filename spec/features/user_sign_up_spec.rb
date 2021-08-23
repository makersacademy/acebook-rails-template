require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "user can sign up" do
    user_sign_up
    expect(current_path).to eq '/'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "user can't sign up if fields are blank" do
    visit "/users/sign_up"
    click_button "Sign up"
    expect(current_path).to eq '/users'
    expect(page).to have_content("2 errors prohibited this user from being saved")
  end
end