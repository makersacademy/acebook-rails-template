# require 'rails_helper'
#
# RSpec.feature "User can log out of account from their profile page", type: :feature do
#   scenario 'successfuly' do
#     visit root_path
#     click_link "Sign up"
#     fill_in "Email", with: 'thebluss@gmail.com'
#     fill_in "Firstname", with: "Blillie"
#     fill_in "Lastname", with: "Bluss"
#     fill_in "Password", with: "ShutYaBluss"
#     fill_in "Password confirmation", with: "ShutYaBluss"
#     click_button 'Sign up'
#     click_link 'View profile'
#     click_link 'Sign Out'
#     expect(page).to have_content("Log in")
#   end
# end
