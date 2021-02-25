# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can update a former post to display a new message' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
    first('.post').click_link 'Edit'
    fill_in 'Message', with: 'I am updated!'
    click_button 'Submit'
    expect(page).not_to have_content('Hello, world!')
    expect(page).to have_content('I am updated')
  end
end