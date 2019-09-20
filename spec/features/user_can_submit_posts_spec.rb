# frozen_string_literal: true

# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.feature 'Timeline', type: :feature do
#   before do
#     sign_up_with('username', 'test@mail.com', 'testing')
#   end
#   scenario 'Can submit posts and view them' do
#     visit '/posts'
#     click_link 'Add new post'
#     fill_in 'Message', with: 'Hello, world!'
#     click_button 'Submit'
#     expect(page).to have_content('Hello, world!')
#   end
# 
#   scenario 'Can submit posts and view them in correct order' do
#     visit '/posts'
#     click_link 'Add new post'
#     fill_in 'Message', with: 'Hello, world!'
#     click_button 'Submit'
#     click_link 'Add new post'
#     fill_in 'Message', with: 'Hello, world2!'
#     click_button 'Submit'
#     expect(page).to have_content 'world2'
#   end

#   scenario 'posts have timestamp' do
#     visit '/posts'
#     click_link 'Add new post'
#     fill_in 'Message', with: 'Hello, world!'
#     click_button 'Submit'
#     t = DateTime.now
#     expect(page).to have_text(t.strftime('Posted: %d/%m/%Y'))
#   end
# end
