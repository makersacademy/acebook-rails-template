# require 'rails_helper'

# RSpec.feature "Edit Post", type: :feature do
#   scenario "Can submit posts and then edit them" do

#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: "Hello there!"
#     click_button "Submit"
#     expect(page).to have_content("Hello there!")
#     click_on 'Edit'
#     fill_in "Message", with: "General Kenobi!"
#     click_button "Submit"
#     expect(page).to_not have_content("Hello there!")
#     expect(page).to have_content("General Kenobi!")
#   end
# end
