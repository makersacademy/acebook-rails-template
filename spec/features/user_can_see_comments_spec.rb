# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  scenario 'Can see comments page' do
    create_hello_world_post
    visit '/posts'
    click_button 'Comments'
    expect(page).to have_content('Post')
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can create comments' do
    create_hello_world_post
    visit '/posts'
    click_button 'Comments'
    fill_in 'Comment text', with: 'Hello back!'
    click_button 'Create Comment'
    expect(page).to have_content('Hello back!')
  end
end
