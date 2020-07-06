# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can delete posts ' do

    visit '/signup'
    fill_in 'user[name]', with: 'Emanuele'
    fill_in 'user[email]', with: 'ema@test.com'
    fill_in 'user[password]', with: '12345'
    click_on 'Create Account'
    click_link 'New post'
    fill_in 'Message', with: 'Test Post!'
    click_button 'New Post'
    click_link('delete_post', match: :first)
    expect(page).not_to have_content('Test Post!')
  end
end
