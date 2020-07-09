# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Timeline', type: :feature do
  it 'Can delete posts ' do
    log_in_eman
    click_link 'New post'
    fill_in 'Message', with: 'Test Post!'
    click_button 'New Post'
    click_link('delete_post', match: :first)
    expect(page).not_to have_content('Test Post!')
  end
end
