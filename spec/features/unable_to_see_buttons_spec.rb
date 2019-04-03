# frozen_string_literal: true

require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Hide button if not post owner' do
    create_user
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Post'
    click_link 'Logout'
    create_user2
    expect(page).to have_no_link('Delete')
  end
end