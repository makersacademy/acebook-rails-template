# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.feature 'Delete', type: :feature do
#   scenario 'Can delete own posts' do
#     visit '/'
#     fill_in 'Username', with: 'Example'
#     fill_in 'Email', with: 'test@example.com'
#     fill_in 'Password', with: 'testing123'
#     fill_in 'Confirmation', with: 'testing123'
#     click_button 'Create my account'
#     click_link 'New post'
#     fill_in 'Message', with: 'Hello, world!'
#     click_button 'Submit'
#     click_link 'Delete'
#     page.accept_alert
#     expect(page).not_to have_content('Hello, world!')
#   end

#   scenario 'Can not delete another users post' do
#     visit '/'
#     fill_in 'Username', with: 'Example'
#     fill_in 'Email', with: 'test@example.com'
#     fill_in 'Password', with: 'testing123'
#     fill_in 'Confirmation', with: 'testing123'
#     click_button 'Create my account'
#     click_link 'New post'
#     fill_in 'Message', with: 'Hello, world!'
#     click_button 'Submit'
  
#     visit '/'
#     fill_in 'Username', with: 'Example2'
#     fill_in 'Email', with: 'test@example2.com'
#     fill_in 'Password', with: 'testing123'
#     fill_in 'Confirmation', with: 'testing123'
#     click_button 'Create my account'
#     click_link 'Delete'
#     page.driver.browser.switch_to.alert.accept
#     expect(page).to have_content('Hello, world!')
#     expect(page).to have_content('Post deleted')
#   end
# end