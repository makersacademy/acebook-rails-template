# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Edit posts', type: :feature do
  scenario 'Can edit own posts' do
    visit '/'
    fill_in 'Username', with: 'Example'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testing123'
    fill_in 'Confirmation', with: 'testing123'
    click_button 'Create my account'
    fill_in "Post on Example's wall", with: 'Hello'
    click_button 'Submit'
    click_link 'Edit'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Cannot edit another users post' do
    visit '/'
    fill_in 'Username', with: 'Example'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testing123'
    fill_in 'Confirmation', with: 'testing123'
    click_button 'Create my account'
    click_link 'Home'
    fill_in 'post_message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/'
    fill_in 'Username', with: 'Example2'
    fill_in 'Email', with: 'test@example2.com'
    fill_in 'Password', with: 'testing123'
    fill_in 'Confirmation', with: 'testing123'
    click_button 'Create my account'
    click_link 'Home'
    expect(page).to_not have_content('Edit')
    expect(page).to_not have_content('Delete')
  end
end
