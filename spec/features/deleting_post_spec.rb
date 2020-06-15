# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Delete post', type: :feature do
  scenario 'User can delete posts' do
    sign_up_helper('test@test.com', '123456')
    log_in_helper('test@test.com', '123456')
    click_button 'New post'
    fill_in 'Message', with: 'Please delete me!!'
    click_button 'Submit'
    expect(page).to have_content('Please delete me!!')
    click_button 'Delete'
    expect(page).to_not have_content('Please delete me!!')
    expect(page).to_not have_content('You can only delete posts that you created. Classic Roku.')
  end

  scenario 'Testing to delete the second post' do
    sign_up_helper('test@test.com', '123456')
    log_in_helper('test@test.com', '123456')
    click_button 'New post'
    fill_in 'Message', with: 'Please delete me!!'
    click_button 'Submit'
    expect(page).to have_content('Please delete me!!')
    click_button 'New post'
    fill_in 'Message', with: 'Please delete me toooo!!'
    click_button 'Submit'
    expect(page).to have_content('Please delete me toooo!!')
    deleteID = Post.find_by(message: 'Please delete me toooo!!').id
    find_button(deleteID).click
    expect(page).to_not have_content('Please delete me toooo!!')
    expect(page).to_not have_content('You can only delete posts that you created. Classic Roku.')
  end
end
