# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Editing Posts', type: :feature do
  scenario 'Users can edit their own posts' do
    register
    click_link 'Timeline'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
    click_link 'update'
    fill_in 'Message', with: 'This is the updated post!'
    click_button 'Submit'
    expect(page).not_to have_content('Hello, world!')
    expect(page).to have_content('This is the updated post!')
  end

  scenario 'Users cannot edit other users posts' do
    register
    click_link 'Timeline'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Sign Out'
    user_two
    click_link 'Timeline'
    expect(page).not_to have_link('update')
  end
end