# require 'rails_helper'

# RSpec.feature "Sign Up", type: :feature do
#     scenario("User can create account") do
#         sign_up
#         expect(page).to have_content("test@example.com")
#     end

#     scenario("User cannot create account with password under 6 characters") do
#         visit('users/sign_up')
#         expect(page).to have_content "Sign up"
#         fill_in "Email", with: "test@example.com"
#         fill_in "Password", with: 'duble'
#         fill_in "Password confirmation", with: 'duble'
#         click_button "Sign up"
#         expect(page).to have_content("Password is too short (minimum is 6 characters")
#     end

#     scenario("User cannot create account with password over 10 characters") do
#         visit('users/sign_up')
#         expect(page).to have_content "Sign up"
#         fill_in "Email", with: "test@example.com"
#         fill_in "Password", with: '12345678910'
#         fill_in "Password confirmation", with: '12345678910'
#         click_button "Sign up"
#         expect(page).to have_content("Password is too long (maximum is 10 characters)")
#     end

#     scenario("Users cannot create account with the same email address") do
#         sign_up
#         click_link("Logout")
#         visit('sign_up')
#         expect(page).to have_content "Sign up"
#         fill_in "Email", with: "test@example.com"
#         fill_in "Password", with: 'double'
#         fill_in "Password confirmation", with: 'double'
#         click_button "Sign up"
#         expect(page).to have_content("Email has already been taken")
#     end
# end