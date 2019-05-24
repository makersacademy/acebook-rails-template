# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Updating Posts', type: :feature do
  scenario 'user can edit posts' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_button 'Edit'
    fill_in 'Message', with: 'Hello, planet!'
    click_button 'Submit'
    expect(page).to have_content("Hello, planet")
  end
end
