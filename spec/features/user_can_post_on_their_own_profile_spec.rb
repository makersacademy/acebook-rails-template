# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Profile page', type: :feature do
  scenario 'Can post' do
    signup
    click_link 'My Profile'
    fill_in 'post_message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'My Profile'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'can delete posts' do
    signup
    click_link 'My Profile'
    fill_in 'post_message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'My Profile'
    click_link 'Delete post'
    expect(page).not_to have_content('Hello, world!')
  end
end
