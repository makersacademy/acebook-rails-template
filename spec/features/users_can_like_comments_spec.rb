# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Liking Comments' do
  scenario 'Can like a post and see like count', type: :feature do
    # rubocopArrange
    sign_up
    add_new_post
    click_button('Show')
    add_comment
    # Action
    click_link('Like Comment')
    # Assert
    expect(page).to have_content 'Like 1'
  end

  scenario 'Users can like a comment only once', type: :feature do
    # Arrange
    sign_up
    add_new_post
    click_button('Show')
    add_comment
    # Action
    click_link('Like Comment')
    click_link('Like Comment')
    # Assert
    expect(page).to have_content 'Like 0'
    expect(page).not_to have_content 'Like 1'
  end
end
