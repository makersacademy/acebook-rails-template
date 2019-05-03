# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Delete post belonging to another user', type: :feature do
  scenario "User cannot delete other people's posts" do
    sign_up_helper('test@test.com', '123456')
    log_in_helper('test@test.com', '123456')
    new_post_helper('This post belongs to Wardah')

    expect(page).to have_content('This post belongs to Wardah')
    click_button 'Log out'

    sign_up_helper('test2@test.com', '654321')
    log_in_helper('test2@test.com', '654321')

    deleteID = Post.find_by(message: 'This post belongs to Wardah').id
    find_button(deleteID).click

    expect(page).to have_content('This post belongs to Wardah')
  end

  scenario 'User receives a useful error message' do
    sign_up_helper('test@test.com', '123456')
    log_in_helper('test@test.com', '123456')
    new_post_helper('Post one two three')

    expect(page).to have_content('Post one two three')
    click_button 'Log out'

    sign_up_helper('test2@test.com', '654321')
    log_in_helper('test2@test.com', '654321')

    deleteID = Post.find_by(message: 'Post one two three').id
    find_button(deleteID).click

    expect(page).to have_content('Post one two three')
    expect(page).to have_content('You can only delete posts that you created. Classic Roku.')
  end
end
