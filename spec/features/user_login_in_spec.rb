require 'spec_helper'

RSpec.feature "User sign in", type: :feature do
  scenario "User can sign in after registration" do
    user_sign_up
    click_link "Sign_out"
    fill_in "Email", with: "codingatmakers@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end
end
