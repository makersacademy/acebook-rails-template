# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  scenario 'after creating a post, user can comment' do
    make_a_coffee
    fill_in 'comment_body', with: 'This is a test comment'
    click_button 'Save'
    expect(page).to have_content('This is a test comment')
  end

  scenario 'can comment on a post with a logged in user' do
    make_a_coffee
    click_link 'Home'
    fill_in 'comment_body', with: 'This is a comment'
    click_button 'Save'
    expect(page).to have_content('This is a comment')
  end
end
