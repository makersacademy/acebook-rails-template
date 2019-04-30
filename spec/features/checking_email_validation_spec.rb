# frozen_string_literal: true

# require 'rails_helper'

# RSpec.feature "Checks email validation", type: :feature do

#   scenario "Displays error when entered wrong email address" do
#     visit "/users/new"
#     fill_in 'user_email', with: 'abcdefghi'
#     fill_in 'user_password', with: '123'
#     click_button "Create my account"
#     expect(page).to_not have_content("Please enter a valid email address")
#   end

#   scenario "Successfully logs in and redirects to posting page" do
#     visit "/users/new"
#     fill_in 'user_email', with: 'test@gmail.com'
#     fill_in 'user_password', with: '123'
#     click_button "Create my account"
#     visit '/posts'
#     expect(page).to_not have_content("Congratulations, you are signed up!")
#   end
# end
