# require 'rails_helper'
#
# RSpec.feature "Navigation Bar", type: :feature do
#   scenario "navigation bar home button is present on edit bio page" do
#     visit "/"
#     click_link "Sign up"
#     fill_in "Firstname", with: "Ben"
#     fill_in "Lastname", with: "Smith"
#     fill_in "Username", with: "BenSmith12"
#     fill_in "Email", with: "bensmith@gmail.com"
#     fill_in "Password", with: "password"
#     fill_in "Password confirmation", with: "password"
#     click_button "Sign up"
#     expect(page).to have_button("Home")
#
#   end
#   scenario "navigation bar my page button is present on edit bio page" do
#     visit "/"
#     click_link "Sign up"
#     fill_in "Firstname", with: "Ben"
#     fill_in "Lastname", with: "Smith"
#     fill_in "Username", with: "BenSmith12"
#     fill_in "Email", with: "bensmith@gmail.com"
#     fill_in "Password", with: "password"
#     fill_in "Password confirmation", with: "password"
#     click_button "Sign up"
#     expect(page).to have_button("My Page")
#
#   end
#   scenario "navigation bar logout button is present on edit bio page" do
#     visit "/"
#     click_link "Sign up"
#     fill_in "Firstname", with: "Ben"
#     fill_in "Lastname", with: "Smith"
#     fill_in "Username", with: "BenSmith12"
#     fill_in "Email", with: "bensmith@gmail.com"
#     fill_in "Password", with: "password"
#     fill_in "Password confirmation", with: "password"
#     click_button "Sign up"
#     expect(page).to have_button("Logout")
#
#   end
# end
