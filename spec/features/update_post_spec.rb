# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Update post', type: :feature do
  scenario 'user able to update own post ' do
    create_user
    click_link 'New post'
    fill_in 'Message', with: 'Testing User name'
    click_button 'Post'
    click_link 'Update'
    fill_in 'Message', with: 'Testing User name and add more text'
    click_button 'Post'
    expect(page).to have_content('Testing User name and add more text')
  end
end