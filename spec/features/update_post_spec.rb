# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update a post from link' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, test!'
    click_button 'Submit'
    click_link 'Update'
    fill_in 'Message', with: 'New test'
    expect(page).to have_content('New test')
  end
end