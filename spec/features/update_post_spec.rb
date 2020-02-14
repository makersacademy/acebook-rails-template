# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update a post from link' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, test!'
    click_button 'Submit'
    click_link 'Edit'
    fill_in 'post[message]', with: 'New test'
    click_button 'Update Post'
    expect(page).to have_content('New test')
  end
end
