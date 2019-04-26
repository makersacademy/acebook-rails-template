# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can delete pre-made posts' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Post!'

    expect(current_path).to eq('/posts')
    expect(page).to have_content('Hello, world!')

    click_link('Delete')
    expect(current_path).to eq('/posts')
    expect(page).not_to have_content('Hello, world!')
  end
end
