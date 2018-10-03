# require 'rails_helper'
# require 'helpers/posts_helper'
# require 'helpers/user_registration_helper'
# include ActiveSupport::Testing::TimeHelpers

# RSpec.feature "Timeline", type: :feature do
#   scenario "Can submit posts and view them" do
#     visit 'users/sign_up'
#     sign_up
#     visit "/posts"
#     save_and_open_page

#     click_link "New post"
#     fill_in "Message", with: "Hello, world!"
#     click_button "Submit"
#     expect(page).to have_content("Hello, world!")
#     expect(page).to have_content(Time.current.strftime("%l:%M %p - %e %b '%y"))
#   end

#   scenario "User cannot post empty message" do
#     visit 'users/sign_up'
#     sign_up
#     visit "/posts"
#     save_and_open_page
#     click_link "New post"
#     fill_in "Message", with: ""
#     click_button "Submit"
#     expect(page).to have_field("Message")
#     expect(page).to have_content("Message can't be blank")
#   end

#   scenario "Post are displayed in desc order" do
#     visit 'users/sign_up'
#     sign_up
#     visit "/posts"
#     save_and_open_page
#     click_link "New post"
#     create_two_posts # Call to post_helper.rb function
#     expect("Message A, displayed above Message B").to appear_before "Message B, displayed below Message A"
#     expect(page).to have_content("Message B, displayed below Message A")
#     expect(page).to have_content("Message A, displayed above Message B")
#   end
# end
