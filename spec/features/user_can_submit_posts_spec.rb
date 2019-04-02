# frozen_string_literal: true

require 'rails_helper'
require './spec/features/web_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    create_user
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Post'
    expect(page).to have_content('Hello, world!')
  end
end
