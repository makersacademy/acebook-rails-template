require 'rails_helper'
require 'helpers/user_helper'

RSpec.feature "User Registration", type: :feature do
  scenario "User can sign up for BragBook" do
    visit "/users/sign_up"
    fill_in "user_first_name", with: "Wendy"
    fill_in "user_last_name", with: "McWend"
    fill_in "user_email", with: "wendy@wendy.com"
    fill_in "user_password", with: "WendyWendy"
    fill_in "user_password_confirmation", with: "WendyWendy"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end

RSpec.feature "User Registration", type: :feature do
  scenario "User must sign up with a valid email address" do
    visit "/users/sign_up"
    fill_in "user_first_name", with: "Wendy"
    fill_in "user_last_name", with: "McWend"
    fill_in "user_email", with: "wendy@@wendy.com"
    fill_in "user_password", with: "WendyWendy"
    fill_in "user_password_confirmation", with: "WendyWendy"
    click_button "Sign up"
    expect(page).to have_content("Email is invalid")
  end
end

RSpec.feature "User Registration", type: :feature do
  scenario "User must sign up with a valid password of between 6-10 characters" do
    visit "/users/sign_up"
    fill_in "user_first_name", with: "Wendy"
    fill_in "user_last_name", with: "McWend"
    fill_in "user_email", with: "wendy@wendy.com"
    fill_in "user_password", with: "WendyWendyWendyWendyWendy"
    fill_in "user_password_confirmation", with: "WendyWendyWendyWendyWendy"
    click_button "Sign up"
    expect(page).to have_content("Password is too long (maximum is 10 characters")
  end
end

# RSpec.feature "User Registration", type: :feature do
#   scenario "User cannot sign up if email has already been taken" do
#     sign_up
    
#   end
# end


