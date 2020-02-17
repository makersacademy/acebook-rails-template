# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can edit post content' do
    sign_up
    new_post

    visit '/posts'
    click_link 'Edit'
    fill_in "area", with: 'Updated Text'
    click_button 'Update Post'
    expect(page).to have_content('Updated Text')
  end
end
