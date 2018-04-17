# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Liking Comments', type: :feature do
  scenario 'Can like a post and see like count' do
    # rubocopArrange
    sign_up
    add_new_post
    add_comment
    # Action
    click_link('Like Comment')
    # Assert
    expect(page).to have_content 'Comment Likes: 1'
  end

  scenario 'Users can like a comment only once' do
    # Arrange
    sign_up
    add_new_post
    add_comment
    # Action
    click_link('Like Comment')
    click_link('Like Comment')
    # Assert
    expect(page).to have_content 'Comment Likes: 0'
  end
end
