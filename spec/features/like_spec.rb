# require "helpers/authentication_helper"
# require 'rails_helper'
#
# RSpec.feature "Likes", type: :feature do
#   scenario "Like a post" do
#     sign_up_as_ben()
#     click_link "My Page"
#     fill_in "post_text", with: "Hello this is my first post"
#     click_button "submit"
#     click_link "Logout"
#     visit "/"
#     click_link "Sign up"
#     fill_in "Firstname", with: "Paul"
#     fill_in "Lastname", with: "Kane"
#     fill_in "Username", with: "PaulKane12"
#     fill_in "Email", with: "paulkane@gmail.com"
#     fill_in "Password", with: "password"
#     fill_in "Password confirmation", with: "password"
#     click_button "Sign up"
#     click_link "My Page"
#     click_button "Change Profile Picture"
#     attach_file("Image", Rails.root + "app/assets/default.png")
#     click_button "Update Avatar"
#     click_link "My Page"
#     click_link "Home"
#     click_link "BenSmith12"
#     click_button "Like"
#     expect(page).to have_content("Unlike (1)")
#   end
# end
