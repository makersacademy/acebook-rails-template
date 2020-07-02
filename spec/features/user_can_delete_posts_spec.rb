# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can delete posts ' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Test Post!'
    click_button 'New Post'
    click_link('delete_post')
    expect(page).not_to have_content('Test Post!')
  end
end
