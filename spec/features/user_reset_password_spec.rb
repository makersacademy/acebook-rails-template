require 'rails_helper'

RSpec.feature "User password recovery", type: :feature do
  scenario "User receive an email with recovery instructions" do
    user_sign_up
    click_link "Sign_out"
    click_link "Forgot your password?"
    fill_in "Email", with: "codingatmakers@gmail.com"
    click_button "reset password"
    expect(page).to have_content "You will receive an email"
  end
end
