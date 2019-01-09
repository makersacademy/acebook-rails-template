# require 'rails_helper'
#
# RSpec.feature "Comments", type: :feature do
#   before :each do
#     visit "/users/sign_in"
#     fill_in "Email", with: "hello@test.com"
#     fill_in "Password", with: "hello2"
#     click_button "Log in"
#   end
#
#   scenario "Can leave a comment on a post and view them" do
#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: "Hello, world!"
#     click_button "Submit"
#     click_button "Comment"
#     fill_in "content", with: "Test comment"
#     click_button "Submit"
#     expect(page).to have_content "Test comment"
#   end
# end
