# frozen_string_literal: true

require 'rails_helper'
require 'support/features/clearance_helpers'

# RSpec.feature 'CRUD', type: :feature do

#   def add_message(message)
#     fill_in "Message", with: message
#     click_button "Submit"
#   end

#   def delete_post(message)
#     click_link "Delete"
#   end

#   before(:each) do
#     sign_in
#     visit '/posts'
#     add_message('Post 1')
#   end

#   scenario 'User can delete post' do
#     delete_post('Post 1')
#     expect(page).to_not have_content('Post 1')
#   end
# end