# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comments', type: :feature do

  scenario 'after creating a post, user can comment' do
    login_as create( :user ), scope: :user
    visit new_post_path
    
    attach_file('post[postimage]', "./files/images/caffeine-coffee-cup-6347.jpg")
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Create Post'
    fill_in 'comment_body', with: 'This is a test comment'
    click_button 'Save'
    expect(page).to have_content('This is a test comment')
  end

  scenario 'can comment on a post with a logged in user' do
    login_as create( :user ), scope: :user
    visit new_post_path
    
    attach_file('post[postimage]', "./files/images/caffeine-coffee-cup-6347.jpg")
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Create Post'
    click_link 'Home'
    fill_in 'comment_body', with: 'This is a comment'
    click_button 'Save'
    expect(page).to have_content('This is a comment')
  end
end

