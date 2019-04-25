# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update pre-made posts' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Post!'

    expect(current_path).to eq('/posts')
    expect(page).to have_content('Hello, world!')

    click_link('Edit')

    expect(current_path).to eq('/posts/1/edit')

    fill_in 'Message', with: 'Bye, World!'

    click_button('Edit')

    expect(current_path).to eq('/posts')
    expect(page).to have_content('Bye, World!')
  end
end
