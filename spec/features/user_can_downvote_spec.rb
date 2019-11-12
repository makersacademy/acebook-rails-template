# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.feature "Votes", type: :feature do
#   pending
#   scenario "Can downvote posts" do
#     visit('/')
#     create_user
#     login_user
#     create_post
#     click_link 'Badger'
#     expect(page).to have_content('Hedgehog 0')
#     expect(page).to have_content('Badger 1')
#   end

#   # scenario "A user cannot add more than one downvote to a post" do
#   #   pending
#   #   visit('/')
#   #   create_user
#   #   login_user
#   #   create_post
#   #   click_link 'Badger'
#   #   click_link 'Badger'
#   #   expect(page).to have_content('Hedgehog 0')
#   #   expect(page).to have_content('Badger 1')
#   # end

#   scenario "Additional users can add a downvote to a post" do
#     pending
#     visit('/')
#     create_user
#     login_user
#     create_post
#     click_link 'Badger'
#     logout_user
#     create_user_two
#     login_user_two
#     click_link 'Badger'
#     expect(page).to have_content('Hedgehog 0')
#     expect(page).to have_content('Badger 2')
#   end
# end
