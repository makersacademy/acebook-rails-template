# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Liking Posts' do
  scenario 'Can like a post and see like count' do
    # Arrange
    sign_up
    add_new_post
    # Action
    click_button('Show')
    click_link('Like')
    # Assert
    expect(page).to have_content('Like 1')
  end

  scenario 'Users can like a post only once' do
    # Arrange
    sign_up
    add_new_post
    # Action
    click_button('Show')
    click_link('Like')
    click_link('Like')
    # Assert
    expect(page).to have_content 'Like 0'
  end
end
