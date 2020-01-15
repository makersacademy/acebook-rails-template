# require 'rails_helper'

# RSpec.feature "Delete", type: :feature do
#   scenario "Can delete specific posts" do
#     visit "/sign_up"
#     fill_in "First name", with: "David"
#     fill_in "Surname", with: "Bacall"
#     fill_in "Email", with: "dbacall@hotmail.co.uk"
#     fill_in "Password", with: "password"
#     within ".submit-field" do
#       click_on "Sign up"
#     end

#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: "Test post 1"
#     click_button "Submit"
#     click_link "New post"
#     fill_in "Message", with: "Test post 2"
#     click_button "Submit"
    
#     within('div#1') do
#       click_button "Delete"
#     end
    
#     expect(page).not_to have_content("Test post 1")
#     expect(page).to have_content("Test post 2")
#   end
# end