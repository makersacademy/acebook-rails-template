# frozen_string_literal: true

# # frozen_string_literal: true
#
# require 'rails_helper'
# require 'helpers/users_helper_spec'
#
# RSpec.feature 'Timeline', type: :feature do
#   scenario 'Can submit posts and view them' do
#     sign_up_test
#     click_link 'New post'
#     expect(page).to have_content('Message')
#     fill_in 'Message', with: "Hello, coppers!\bDid you miss me?"
#     click_button 'Submit'
#     expect(page).to have_css('p', text: 'Hello, coppers!')
#     expect(page).to have_css('p', text: 'Did you miss me?')
#   end
#   scenario 'Can update posts' do
#     sign_up_test
#     click_link 'New post'
#     expect(page).to have_content('Message')
#     fill_in 'Message', with: "Hello, coppers!\bDid you miss me?"
#     click_button 'Submit'
#     click_link 'Edit'
#     expect(page).to have_content('Edit Post')
#     fill_in 'Message', with: 'I have updated my post'
#     click_button 'Update Post'
#     expect(page).to have_content('I have updated my post')
#   end
#   scenario 'Can delete posts' do
#     sign_up_test
#     click_link 'New post'
#     expect(page).to have_content('Message')
#     fill_in 'Message', with: "Hello, coppers!\bDid you miss me?"
#     click_button 'Submit'
#     click_link 'Delete'
#     expect(page).not_to have_content("Hello, coppers!\bDid you miss me?")
#   end
# end
