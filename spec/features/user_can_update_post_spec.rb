# HANSA CAN YOU PLEASE CHECK THIS TEST

# require "rails_helper"

# RSpec.feature "Timeline", type: :feature do
#   scenario "User can see edit button" do
#     user_sign_up

#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: "Hello, world!"
#     click_button "Submit"
#     expect(page.all("#posts").first.text).to include("Edit this post")
#   end

#   scenario "User can edit their post" do
#     user_sign_up

#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: "Hello, world!"
#     click_button "Submit"
#     click_link "edit this post"
#     expect(page.all("#posts").first.text).to_eq("Bye, world!")
#   end
# end